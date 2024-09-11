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
}
