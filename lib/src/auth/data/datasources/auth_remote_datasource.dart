import 'package:antares_insight_app/core/errors/exceptions.dart';
import 'package:antares_insight_app/core/utils/pair.dart';
import 'package:antares_insight_app/core/utils/typedef.dart';
import 'package:antares_insight_app/src/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Pair<String, UserModel>> loginUser({
    required String email,
    required String password,
  });

  Future<UserModel> verifyUserAuthentication({
    required String accessToken,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required Dio dio,
    required FirebaseMessaging firebaseMessaging,
  })  : _dio = dio,
        _firebaseMessaging = firebaseMessaging;

  final Dio _dio;
  final FirebaseMessaging _firebaseMessaging;

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

  @override
  Future<Pair<String, UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final fcmToken = await _firebaseMessaging.getToken();

      const path = '/api/auth/login';
      final data = {
        'email': email,
        'password': password,
        'fcmToken': fcmToken,
      };

      final response = await _dio.post<DataMap>(path, data: data);

      final responseData = response.data!['data'] as DataMap;

      final token = responseData['token'] as String;
      final user = UserModel.fromMap(responseData['user'] as DataMap);

      return Pair(token, user);
    } on DioException catch (e) {
      throw HttpException.fromDio(e);
    } catch (e) {
      throw GeneralException(message: e.toString());
    }
  }

  @override
  Future<UserModel> verifyUserAuthentication({
    required String accessToken,
  }) async {
    try {
      const path = '/api/users/current';
      final extra = {'accessToken': accessToken};

      final response = await _dio.get<DataMap>(
        path,
        options: Options(extra: extra),
      );

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
