import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:e_state_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/contracts/user_contract.dart';
import '../../utilities/handler/image_picker_handler.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._userContract) : super(UserInfoInitial());

  final UserContract _userContract;
  User get currentUser => FirebaseAuth.instance.currentUser!;

  final imageSubject = BehaviorSubject<File?>.seeded(null);
  final userSubject = BehaviorSubject<UserModel?>();

  final controllers = {
    "fullName": TextEditingController(),
    "email": TextEditingController(),
    "phoneNumber": TextEditingController(),
  };

  void getEmail() {
    controllers['email']!.text = currentUser.email!;
  }

  void getUser() async {
    try {
      final user = await _userContract.getUser(currentUser.uid);
      userSubject.add(user);
    } catch (e) {
      userSubject.addError('Error occured');
    }
  }

  Future<void> updateUsers() async {
    try {
      emit(UserInfoLoading());
      String? imageUrl = await _uploadImageToStorage();

      // If no image was uploaded, use a default image from assets
      if (imageUrl != null) await currentUser.updatePhotoURL(imageUrl);
      await currentUser.updateDisplayName(controllers['fullName']!.text);
      // await currentUser.updatePhotoURL();
      await _userContract.addUser(
        currentUser,
        controllers['fullName']!.text,
        controllers["phoneNumber"]!.text,
      );
      emit(UserInfoSuccess());
    } on FirebaseAuthException catch (e) {
      emit(UserInfoFailure('$e'));
      log('Error: $e');
    } catch (e, s) {
      emit(UserInfoFailure('$e'));
      log('Error: $e');
      log('Error: $s');
    }
  }

  void openGallery() async {
    final file = await ImagePickerHandler.openGallery();
    imageSubject.value = file;
  }

  Future<String?> _uploadImageToStorage() async {
    try {
      if (imageSubject.value == null) return null;
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child('/${currentUser.uid}')
          .child('/profiles')
          .child('/${imageSubject.value!.path.split('/').last}');

      await ref.putData(imageSubject.value!.readAsBytesSync());
      final url = await ref.getDownloadURL();
      log('URL: $url');
      return url;
    } catch (e) {
      log('STORAGE ERROR: $e');
      return null;
    }
  }

  void logOut() async {
    emit(UserInfoLoading());
    await FirebaseAuth.instance.signOut();
    emit(UserInfoSuccess());
  }

  /*Future<String?> _uploadDefaultImageToStorage(Uint8List imageBytes) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child('${currentUser.uid}')
          .child('profiles')
          .child('default_avatar.png');

      await ref.putData(imageBytes);
      final url = await ref.getDownloadURL();
      log('Default Image URL: $url');
      return url;
    } catch (e) {
      print("Error uploading default image: $e");
      return null;
    }
  }*/

  @override
  Future<void> close() {
    for (final controller in controllers.values) {
      controller.dispose();
    }
    imageSubject.close();
    return super.close();
  }
}
