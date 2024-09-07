import 'package:antares_insight_app/core/errors/exceptions.dart';
import 'package:antares_insight_app/core/errors/failures.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/users/data/datasources/users_remote_data_source.dart';
import 'package:antares_insight_app/src/users/domain/entities/user.dart';
import 'package:antares_insight_app/src/users/domain/repos/users_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UsersRepo)
class UsersRepoImpl extends UsersRepo {
  const UsersRepoImpl(this._remoteDataSource);

  final UsersRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on HttpException catch (e) {
      return Left(
        HttpFailure.fromException(e),
      );
    } on ClientException catch (e) {
      return Left(
        ClientFailure.fromException(e),
      );
    } on GeneralException catch (e) {
      return Left(
        GeneralFailure.fromException(e),
      );
    }
  }
}
