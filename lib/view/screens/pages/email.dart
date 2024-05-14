import 'package:flutter/material.dart';
import 'package:goodmorning_service/viewmodels/login_viewmodel.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../data/network/base_api_service.dart';
import '../../../data/network/user_data_service.dart';
import '../../../models/user_information.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {

  String? _userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    try {
      // UserDataService를 사용하여 유저 넘버 데이터를 가져옴
      UserEmailInformation? userData = await UserDataService.getUserEmailData();
      if (userData != null) {
        setState(() {
          _userEmail = userData.useremail;
        });
      } else {
        print('Failed to get user number data.');
      }
    } catch (e) {
      print('Error: $e');
      // 에러 처리 필요
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Center(child: null),
            ),
            Text(
              'User Email: $_userEmail',
              style: TextStyle(fontSize: 20.0),
            ),
            const Expanded(
              child: Center(child: null),
            ),
          ],
        ),
      ),
    );
  }
}
