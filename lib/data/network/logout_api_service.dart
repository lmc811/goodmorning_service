import 'package:dio/dio.dart';

import 'app_url.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: AppUrl.url)); //Dio 인스턴스를 생성, 기본 URL 설정

  Future<void> logout(String refreshToken) async {
    try {
      await dio.post('/logout', options: Options(headers: { //Dio 인스턴스를 사용하여 POST 요청을 보냄.
        // /logout 엔드포인트에 요청을 보내며, 로그아웃 수행
        'authorization': 'Bearer $refreshToken', //Authorization 헤더에 Refresh Token 포함
      }));
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}