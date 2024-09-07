import 'package:antares_insight_app/core/services/dio_http_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  Dio get dio => DioHttpClient.instance;
}
