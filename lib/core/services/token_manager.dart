import 'package:antares_insight_app/core/errors/exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class TokenManager {
  TokenManager({
    required FlutterSecureStorage localStorage,
  }) : _localStorage = localStorage;

  final FlutterSecureStorage _localStorage;

  Future<void> delete() async {
    try {
      await _localStorage.delete(key: 'token');
    } catch (e) {
      throw const GeneralException(
        message: 'Unknown error occured. Please try again later.',
      );
    }
  }

  Future<String> read() async {
    try {
      final token = await _localStorage.read(key: 'token');

      if (token == null) {
        throw const CacheException(
          message: 'Access token could not be found',
        );
      }

      return token;
    } on CacheException {
      rethrow;
    } catch (e) {
      throw const GeneralException(
        message: 'Unknown error occured. Please try again later.',
      );
    }
  }

  Future<void> write(String token) async {
    try {
      await _localStorage.write(key: 'token', value: token);
    } catch (e) {
      throw const GeneralException(
        message: 'Unknown error occured. Please try again later.',
      );
    }
  }
}
