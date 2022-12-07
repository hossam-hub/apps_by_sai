
import 'dart:convert';

import 'package:sai_app/models/user_model.dart';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

class RegisterService{
  static var url=Uri.parse(ServerConfig.dns+ServerConfig.register);
  static var client = http.Client();

  static register(
      {
        required userCode,
        required fName,
        required lName,
        required password,
        required confirmPassword,
        required userLevel
      }
      )async{
    var response =await client.post(
        url,
      headers:{'Content-type':'application/json'},
      body: jsonEncode(<String,String>{
        "usr_code":userCode,
        "user_first_name":fName,
        "user_last_name":lName,
        "password":password,
        "confirm":confirmPassword,
        "user_level":userLevel
      }
      ),
    );
    if(response.statusCode==200||response.statusCode==201){
      var stringObject = response.body;
      var user =userFromJson(stringObject);
      return user;
    }



  }
}