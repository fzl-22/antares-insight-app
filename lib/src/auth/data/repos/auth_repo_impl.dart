import 'package:antares_insight_app/core/errors/exceptions.dart';
import 'package:antares_insight_app/core/errors/failures.dart';
import 'package:antares_insight_app/core/services/token_manager.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/data/datasources/auth_remote_datasource.dart';
import 'package:antares_insight_app/src/auth/domain/entities/user.dart';
import 'package:antares_insight_app/src/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required AuthRemoteDataSource remoteDataSource,
    required TokenManager tokenManager,
  })  : _remoteDataSource = remoteDataSource,
        _tokenManager = tokenManager;

  final AuthRemoteDataSource _remoteDataSource;
  final TokenManager _tokenManager;

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

  @override
  ResultFuture<User> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.loginUser(
        email: email,
        password: password,
      );

      final token = result.first;
      final user = result.second;

      await _tokenManager.write(token);

      return Right(user);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on HttpException catch (e) {
      return Left(HttpFailure.fromException(e));
    } on GeneralException catch (e) {
      return Left(GeneralFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> verifyUserAuthentication() async {
    try {
      final accessToken = await _tokenManager.read();

      final result = await _remoteDataSource.verifyUserAuthentication(
        accessToken: accessToken,
      );

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on HttpException catch (e) {
      return Left(HttpFailure.fromException(e));
    } on GeneralException catch (e) {
      return Left(GeneralFailure.fromException(e));
    }
  }
}
