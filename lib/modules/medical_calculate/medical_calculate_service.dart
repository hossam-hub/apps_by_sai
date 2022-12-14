import 'dart:convert';
import 'package:sai_app/modules/medical_calculate/calculate_model.dart';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

class MedicalCalculateService {
   static var url2 =Uri.parse(ServerConfig.dns+ServerConfig.calculate);
   static var client =http.Client();

   static calculate(
       {
         required List<int> age,

   }
   )async{
     var response =await client.post(
         url2,
       headers: {'Content-type':'application/json'},
       body: jsonEncode(<String,List<int>>{
       "in":age,
       }
       ),
     );
     if(response.statusCode==200||response.statusCode==201){
       var stringObject = response.body;
       var body =calculateFromJson(stringObject);
        print(body);
       return body;
     }else{
        var stringObject = response.body;
        //var body =jsonDecode(stringObject);
        print(stringObject);
       }
   }
}
