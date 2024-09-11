import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/usecases/register_user.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RegisterUser registerUser,
  })  : _registerUser = registerUser,
        super(const _Initial()) {
    on<_RegisterUserEvent>(_registerUserHandler);
  }

  final RegisterUser _registerUser;

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
}
