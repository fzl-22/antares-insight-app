import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/users/domain/entities/user.dart';

abstract class UsersRepo {
  const UsersRepo();

  ResultFuture<List<User>> getUsers();
}
