import 'package:flutter/material.dart';
import 'package:goodmorning_service/view/screens/login_screen.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
// import 'package:goodmorning/view/screens/navigation.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '8124b0e644c549cdb123866662898e15',
    javaScriptAppKey: 'c159b952810ff88e23bf0a8a7c9f7725',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true
      ),
      home: const LoginScreen(),
    );
  }
}
