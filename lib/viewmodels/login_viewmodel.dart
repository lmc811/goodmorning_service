import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodmorning_service/view/screens/login_screen.dart';
import 'package:goodmorning_service/view/screens/navigation.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

String userId = '';
String userEEEmail = '';

Future<void> signInWithKakao() async {
  // 카카오 로그인 구현 예제

// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount().then((value) {
          print('value from kakao $value');
          // navigateToHomePage();
        });
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount().then((value) async {
        print('value from kakao $value');
        try {
          User user = await UserApi.instance.me();
          userEEEmail = user.kakaoAccount!.email.toString();
          userId = user.id.toString();

          print('사용자 정보 요청 성공'
              '\n회원번호: ${user.id}'
              '\n이메일: ${user.kakaoAccount?.email}');
        } catch (error) {
          print('사용자 정보 요청 실패 $error');
        }
        // navigateToHomePage();
      });
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}

// Future<void> fetchUserData() async {
//   try {
//     User user = await UserApi.instance.me();
//     print('사용자 정보 요청 성공'
//         '\n회원번호: ${user.id}'
//         '\n이메일: ${user.kakaoAccount?.email}');
//   } catch (error) {
//     print('사용자 정보 요청 실패 $error');
//   }
// }

Future<void> logout() async {
  try {
    await UserApi.instance.logout();
    print('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
//
// Future<void> signInWithKakao() async {
//   try {
//     if (await isKakaoTalkInstalled()) {
//       await UserApi.instance.loginWithKakaoTalk();
//       print('카카오톡으로 로그인 성공');
//     } else {
//       await UserApi.instance.loginWithKakaoAccount();
//       print('카카오계정으로 로그인 성공');
//     }
//     // 로그인 후에 실행할 작업 추가
//     // await fetchUserData();
//   } on KakaoAuthException catch (e) {
//     print('로그인 실패: ${e.message}');
//   } on KakaoClientException catch (e) {
//     print('클라이언트 에러: ${e.message}');
//   } on PlatformException catch (e) {
//     if (e.code == 'CANCELED') {
//       print('사용자가 취소함');
//     } else {
//       print('플랫폼 에러: ${e.message}');
//     }
//   } catch (e) {
//     print('알 수 없는 에러: $e');
//   }
// }
//
// Future<void> fetchUserData() async {
//   try {
//     User user = await UserApi.instance.me();
//     print('사용자 정보 요청 성공'
//         '\n회원번호: ${user.id}'
//         '\n이메일: ${user.kakaoAccount?.email}');
//   } catch (error) {
//     print('사용자 정보 요청 실패 $error');
//   }
// }
//
// Future<void> logout() async {
//   try {
//     await UserApi.instance.logout();
//     print('로그아웃 성공, SDK에서 토큰 삭제');
//   } catch (error) {
//     print('로그아웃 실패, SDK에서 토큰 삭제 $error');
//   }
// }
