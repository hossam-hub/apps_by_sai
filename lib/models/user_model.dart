
import 'dart:convert';

UserModel userFromJson(String str)=>UserModel.toObject(json.decode(str));


class UserModel{
  User user;
  String token;
  UserModel({required this.user,required this.token});

  factory UserModel.toObject(Map<String,dynamic>json)=>
  UserModel(
  user: User.toObject(json['data']),
  token: json['access_token']
  );

  Map<String,dynamic>toJson()=>{
    "data":user.toJson(),
    "access_token":token
  };
}

class User{

  String userLevel;
  String fName;
  String lName;
  String userCode;
  User({required this.fName,required this.lName,required this.userCode,required this.userLevel});

  factory User.toObject(Map<String,dynamic> json)=>User(
      fName: json['USR_FNAME'],
      lName: json['USR_LNAME'],
      userCode: json['USR_CODE'],
      userLevel: json['USR_LEVEL']

  );
  Map<String,dynamic>toJson()=>{
    "USR_FNAME":fName,
    "USR_LNAME":lName,
    "USR_CODE":userCode,
    "USR_LEVEL":userLevel,

  };
}