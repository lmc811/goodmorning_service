import 'package:flutter/material.dart';
import 'package:goodmorning_service/viewmodels/login_viewmodel.dart';

import '../../../data/network/user_data_service.dart';
import '../../../models/user_information.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {

  String? _userNumber;

  @override
  void initState() {
    super.initState();
    _loadUserNumber();
  }

  Future<void> _loadUserNumber() async {
    try {
      // UserDataService를 사용하여 유저 넘버 데이터를 가져옴
      UserNumberInformation? userData = await UserDataService.getUserNumberData();
      if (userData != null) {
        setState(() {
          _userNumber = userData.usernumber;
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
              'User Number: $_userNumber', // 받아온 데이터를 텍스트로 출력,
              style: TextStyle(
                  fontSize: 20.0
              ),
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
