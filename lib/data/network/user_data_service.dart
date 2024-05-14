

import 'package:dio/dio.dart';

import '../../models/user_information.dart';
import 'base_api_service.dart';

class UserDataService{

  static Future<UserNumberInformation?> getUserNumberData() async{
    // try{
    print(2);
    Response response = await ApiClient().dio.get("/user/number");
    print(3);
    print(response.statusCode);
    if(response.data["data"] != null){
      final userData = UserNumberInformation.fromJson(response.data["data"]);
      print(userData);
      print(response.data);

      return userData;
      //  }
      // } on DioException catch(e){
      //    print(e.message);
    }
  }

  static Future<UserEmailInformation?> getUserEmailData() async{
    // try{
    print(5);
    Response response = await ApiClient().dio.get("/user/email");
    print(6);
    if(response.data["data"] != null){
      final userData = UserEmailInformation.fromJson(response.data["data"]);
      print(userData);
      print(response.data);

      return userData;
      //  }


      // } on DioException catch(e){
      //    print(e.message);

    }
  }
}