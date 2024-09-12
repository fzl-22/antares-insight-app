part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.registeringUser() = _RegisteringUser;

  const factory AuthState.userRegistered({
    required User user,
  }) = _UserRegistered;

  const factory AuthState.registerUserFailed({
    required String message,
  }) = _RegisteringUserFailed;

  const factory AuthState.loggingInUser() = _LoggingInUser;

  const factory AuthState.userLoggedIn({
    required User user,
  }) = _UserLoggedIn;

  const factory AuthState.loginUserFailed({
    required String message,
  }) = _LoggingInUserFailed;

  const factory AuthState.verifyingUserAuthentication() =
      _VerifyingUserAuthentication;

  const factory AuthState.userAuthenticationVerified({
    required User user,
  }) = _UserAuthenticationVerified;

  const factory AuthState.verifyUserAuthenticationFailed({
    required String message,
  }) = _VerifyUserAuthenticationFailed;
}
