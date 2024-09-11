import 'package:antares_insight_app/core/errors/exceptions.dart';
import 'package:antares_insight_app/core/errors/failures.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/data/datasources/auth_remote_datasource.dart';
import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<User> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.registerUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      return Right(result);
    } on HttpException catch (e) {
      return Left(HttpFailure.fromException(e));
    } on GeneralException catch (e) {
      return Left(GeneralFailure.fromException(e));
    }
  }
}
