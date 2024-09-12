import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/usecases/login_user.dart';
import 'package:antares_insight_app/src/auth/domain/usecases/register_user.dart';
import 'package:antares_insight_app/src/auth/domain/usecases/verify_user_authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RegisterUser registerUser,
    required LoginUser loginUser,
    required VerifyUserAuthentication verifyUserAuthentication,
  })  : _registerUser = registerUser,
        _loginUser = loginUser,
        _verifyUserAuthentication = verifyUserAuthentication,
        super(const _Initial()) {
    on<_RegisterUserEvent>(_registerUserHandler);
    on<_LoginUserEvent>(_loginUserHandler);
    on<_VerifyUserAuthenticationEvent>(_verifyUserAuthenticationHandler);
  }

  final RegisterUser _registerUser;
  final LoginUser _loginUser;
  final VerifyUserAuthentication _verifyUserAuthentication;

  Future<void> _registerUserHandler(
    _RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.registeringUser());

    final result = await _registerUser(
      RegisterUserParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      ),
    );

    if (isClosed) return;

    result.fold(
      (failure) =>
          emit(AuthState.registerUserFailed(message: failure.errorMessage)),
      (user) => emit(AuthState.userRegistered(user: user)),
    );
  }

  Future<void> _loginUserHandler(
    _LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loggingInUser());

    final result = await _loginUser(
      LoginUserParams(
        email: event.email,
        password: event.password,
      ),
    );

    if (isClosed) return;

    result.fold(
      (failure) =>
          emit(AuthState.loginUserFailed(message: failure.errorMessage)),
      (user) => emit(AuthState.userLoggedIn(user: user)),
    );
  }

  Future<void> _verifyUserAuthenticationHandler(
    _VerifyUserAuthenticationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.verifyingUserAuthentication());

    final result = await _verifyUserAuthentication();

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        AuthState.verifyUserAuthenticationFailed(message: failure.errorMessage),
      ),
      (user) => emit(AuthState.userAuthenticationVerified(user: user)),
    );
  }
}
