import 'package:dio/dio.dart';
import 'package:goodmorning_service/data/network/app_url.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: AppUrl.url));

  ApiClient() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers["authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MTU1MjA2OTgsImV4cCI6MTcxODExMjY5OH0.GsEmZfX1UdDUCHiLoGUS3nqzqySFL8XORu4lUYh3H0Y";
        return handler.next(options);
      },
    ));
  }
}
