import 'package:flutter/material.dart';
import 'package:goodmorning_service/view/screens/login_screen.dart';
import 'package:goodmorning_service/viewmodels/login_viewmodel.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Center(child: null),
            ),
            ElevatedButton(
                onPressed: () {
                  logout();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("로그아웃")),
            const Expanded(
              child: Center(child: null),
            ),
          ],
        ),
      ),
    );
  }
}
