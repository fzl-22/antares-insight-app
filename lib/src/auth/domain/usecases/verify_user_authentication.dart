import 'package:antares_insight_app/core/usecase/usecase.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyUserAuthentication extends UseCaseWithoutParams<User> {
  const VerifyUserAuthentication(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call() {
    return _repo.verifyUserAuthentication();
  }
}
