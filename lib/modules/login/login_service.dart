
import 'dart:convert';

import 'package:sai_app/models/user_model.dart';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

class LoginService{
  static var url1=Uri.parse(ServerConfig.dns+ServerConfig.login);
  static var client = http.Client();

  static login(
      {
        required userCode,
        required password,

      }
      )async{
    var response =await client.post(
      url1,
      headers:{'Content-type':'application/json'},
      body: jsonEncode(<String,String>{
        "usr_code":userCode,
        "password":password,
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