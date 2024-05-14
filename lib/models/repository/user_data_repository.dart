

import 'package:goodmorning_service/data/network/user_data_service.dart';

import '../user_information.dart';

class UserDataRepository{

  static Future<UserNumberInformation?> getUserNumberApi() async {
    print(1);
    final response = await UserDataService.getUserNumberData();

    return response;
  }

  static Future<UserEmailInformation?> getUserEmailApi() async {
    print(4);
    final response = await UserDataService.getUserEmailData();

    return response;
  }
}