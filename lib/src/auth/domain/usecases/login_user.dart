import 'package:antares_insight_app/core/usecase/usecase.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUser extends UseCaseWithParams<User, LoginUserParams> {
  const LoginUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(LoginUserParams params) {
    return _repo.loginUser(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUserParams extends Equatable {
  const LoginUserParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
