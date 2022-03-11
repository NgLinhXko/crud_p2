import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class NetworkUtils{
  static Dio getDioClientConfiguration(String url) {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://run.mocky.io/v3/',
      contentType: "application/json",
      connectTimeout: 10 * 1000,
      receiveTimeout: 60 * 1000,
    ));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true));
    return dio;
  }
}