part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  HomeSuccess(this.properties);

  final List<PropertyModel> properties;
}

final class HomeFailure extends HomeState {
  HomeFailure(this.message);
  final String message;
}
