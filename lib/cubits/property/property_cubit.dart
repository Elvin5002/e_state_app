import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import '../../data/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/contracts/property_contract.dart';
import '../../data/models/property_model.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit(this._propertyContract) : super(PropertyInitial());

  final PropertyContract _propertyContract;
  final _userService = UserService();
  User get currentUser => FirebaseAuth.instance.currentUser!;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();


  final bedroomCount = BehaviorSubject<int>.seeded(0);
  final kitchenCount = BehaviorSubject<int>.seeded(0);
  final bathroomCount = BehaviorSubject<int>.seeded(0);
  final selectedCategory = BehaviorSubject<String?>.seeded('House');

  final selectedImages = BehaviorSubject<List<String>>.seeded([]);
  //final imageSubject = BehaviorSubject<List<XFile>?>.seeded(null);

  void clearInputs() {
    // TextEditingController'ları temizleme
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    sizeController.clear();
    locationController.clear();

    // Sayısal değerleri sıfırlama
    bathroomCount.value = 1;
    bedroomCount.value = 1;
    kitchenCount.value = 1;

    // Kategori seçimini sıfırlama
    selectedCategory.value = null;

    // Resim listesini boşaltma
    selectedImages.value.clear();
  }


  void fetchProperties() async {
    try {
      emit(PropertyLoading());
      final properties = await _propertyContract.fetchProperties();
      emit(PropertySuccess(properties));
    } on FirebaseAuthException catch (e) {
      emit(PropertyFailure('$e'));
      log('firebase: $e');
    } catch (e) {
      emit(PropertyFailure('$e'));
      log('log: $e');
      //log('$s');
    }
  }

  void addProperty() async {
    try {
      emit(PropertyLoading());

      List<String> uploadedImageUrls = [];

      for (var imagePath in selectedImages.value) {
        String imageUrl = await uploadImageToStorage(XFile(imagePath));
        uploadedImageUrls.add(imageUrl);
      }

      final user = await _userService.getUser(currentUser.uid);

      if (user == null) {
        emit(PropertyFailure('User not found'));
        return;
      }

      final property = PropertyModel(
        bathroom: '${bathroomCount.value}',
        bedroom: '${bedroomCount.value}',
        category: selectedCategory.value!,
        description: descriptionController.text,
        images: uploadedImageUrls,
        kitchen: '${kitchenCount.value}',
        location: locationController.text,
        ownerImg: user.photo,
        ownerName: user.fullName,
        phone: user.phone,
        price: priceController.text,
        size: sizeController.text,
        title: titleController.text,
      );

      await _propertyContract.addProperty(property);
    } on FirebaseAuthException catch (e) {
      emit(PropertyFailure('$e'));
      log('firebase: $e');
    } catch (e) {
      emit(PropertyFailure('$e'));
      log('log: $e');
      //log('$s');
    }
  }

  Future<String> uploadImageToStorage(XFile image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('images/${currentUser.uid}/${image.name}');
    await ref.putFile(File(image.path));
    return await ref.getDownloadURL();
  }

  Future<void> pickImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage();

    for (var image in images) {
      selectedImages.value.add(image.path);
    }
  }

  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    selectedCategory.close();
    return super.close();
  }

}
