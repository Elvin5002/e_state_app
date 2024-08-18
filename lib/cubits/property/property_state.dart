part of 'property_cubit.dart';

@immutable
sealed class PropertyState {}

final class PropertyInitial extends PropertyState {}

final class PropertyLoading extends PropertyState {}

final class PropertySuccess extends PropertyState {
  PropertySuccess(this.properties);

  final List<PropertyModel> properties;
}

final class PropertyFailure extends PropertyState {
  PropertyFailure(this.message);
  final String message;
}
