import 'package:antares_insight_app/core/usecase/usecase.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/users/domain/entities/user.dart';
import 'package:antares_insight_app/src/users/domain/repos/users_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUsers extends UseCaseWithoutParams<List<User>> {
  const GetUsers(this._repo);

  final UsersRepo _repo;

  @override
  ResultFuture<List<User>> call() {
    return _repo.getUsers();
  }
}
