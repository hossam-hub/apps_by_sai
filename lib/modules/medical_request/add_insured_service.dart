import 'dart:convert';
import 'package:sai_app/models/insured_model.dart';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

class AddInsuredService {
  static var url = Uri.parse(ServerConfig.dns + ServerConfig.createPolicy);
  static var client = http.Client();

  static AddInsured(
      {required category,
      required firstName,
      required lastName,
      required fatherName,
      required gender,
      required firstNameAR,
      required lastNameAR,
      required fatherNameAR,
      required birthdate,
      required firstPhoneNumber,
      required firstAddress,
      required identityNumber}
      ) async {
    var response =await client.post(
        url,
      headers: {'Content-type':'application/json',
        'Authorization':'Bearer 7|VhXvVuvtmoU0haHnQlIgxctzHBtMjTmKrdcQkYXe'
      },
      body: jsonEncode(<String,String>{
        "OFF_CATEGORY":category,
        "ASR_FNAME":firstName,
        "ASR_LNAME":lastName,
        "ASR_FATHNAME":fatherName,
        "ASR_SEX":gender,
        "ASR_A_FNAME":firstNameAR,
        "ASR_A_LNAME":lastNameAR,
        "ASR_A_FATHNAME":fatherNameAR,
        "ASR_BIRTHDATE":birthdate,
        "ASR_PHONE_1":firstPhoneNumber,
        "ASRA_ZONE_1":firstAddress,
        "ASR_IDENTNUM":identityNumber
      }
      ),

    );
    if(response.statusCode==200||response.statusCode==201){
      print('done');
      var stringToObject=response.body;
      var insured =insuredFromJson(stringToObject);
      return insured;
    }else{
      print(response.body);
    }
  }

}












