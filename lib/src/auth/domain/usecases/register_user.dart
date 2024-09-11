import 'package:antares_insight_app/core/usecase/usecase.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUser extends UseCaseWithParams<User, RegisterUserParams> {
  const RegisterUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(RegisterUserParams params) {
    return _repo.registerUser(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterUserParams extends Equatable {
  const RegisterUserParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [firstName, lastName, email, password];
}
