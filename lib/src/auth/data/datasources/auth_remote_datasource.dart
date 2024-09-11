import 'package:antares_insight_app/core/errors/exceptions.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<UserModel> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      const path = '/api/auth/register';
      final data = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

      final response = await _dio.post<DataMap>(path, data: data);

      final responseData = response.data!['data'] as DataMap;
      final user = UserModel.fromMap(responseData);

      return user;
    } on DioException catch (e) {
      throw HttpException.fromDio(e);
    } catch (e) {
      throw GeneralException(message: e.toString());
    }
  }
}
