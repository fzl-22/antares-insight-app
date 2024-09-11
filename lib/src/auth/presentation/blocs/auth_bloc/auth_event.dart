part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.registerUserEvent({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegisterUserEvent;
}
