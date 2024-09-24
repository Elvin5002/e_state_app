part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<PropertyModel> properties;

  FavoriteSuccess(this.properties);
}

final class FavoriteFailure extends FavoriteState {}
