part of 'facebook_login_cubit.dart';

@immutable
sealed class FacebookLoginState {}

final class FacebookLoginInitial extends FacebookLoginState {}

final class FacebookLoginLoading extends FacebookLoginState {}

final class FacebookLoginSuccess extends FacebookLoginState {}

final class FacebookLoginFailure extends FacebookLoginState {
  final String errorMessage;

  FacebookLoginFailure(this.errorMessage);
}
