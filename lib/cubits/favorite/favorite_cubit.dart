import 'package:bloc/bloc.dart';
import '../../data/models/property_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<PropertyModel> savedProperties = [];

  void saveProperty(PropertyModel property) {
    emit(FavoriteLoading());
    savedProperties.add(property);
    emit(FavoriteSuccess(savedProperties));
  }

  void deleteProperty(PropertyModel property) {
    emit(FavoriteLoading());
    savedProperties.remove(property);
    emit(FavoriteSuccess(savedProperties));
  }

  bool isPropertySaved(PropertyModel property) {
    return savedProperties.contains(property);
  }
}
