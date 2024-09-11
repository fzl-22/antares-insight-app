import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  ResultFuture<User> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
