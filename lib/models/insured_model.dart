import 'dart:convert';

InsuredModel insuredFromJson(String str)=>InsuredModel.toObject(json.decode(str));

class InsuredModel{
  Insured insured;
  InsuredModel({required this.insured});

  factory InsuredModel.toObject(Map<String,dynamic>json)=>
      InsuredModel(
          insured: Insured.toObject(json['insured']),
      );

  Map<String,dynamic>toJson()=>{
    "insured":insured.toJson(),
  };
}


class Insured{

  String firstName;
  String lastName;
  String firstNameAR;
  String lastNameAR;
  String fatherName;
  String fatherNameAR;
  String firstPhoneNumber;
  String secondPhoneNumber;
  //String firstAddress;
  String secondAddress;
  String gender;
  //String category;
  String birthdate;
  String identityNumber;


  Insured(
  {
    required this.firstName,
    required this.lastName,
    required this.firstNameAR,
    required this.lastNameAR,
    required this.fatherName,
    required this.fatherNameAR,
    required this.firstPhoneNumber,
    this.secondPhoneNumber='',
    //required this.firstAddress,
    this.secondAddress='',
    required this.gender,
    //this.category='m',
    required this.birthdate,
    required this.identityNumber,
}
      );

  factory Insured.toObject(Map<String,dynamic> json) {
    return Insured(
      //category: json['OFF_CATEGORY'],
      firstName: json['ASR_FNAME'],
      lastName: json['ASR_LNAME'],
      fatherName: json['ASR_FATHNAME'],
      gender: json['ASR_SEX'],
      firstNameAR: json['ASR_A_FNAME'],
      lastNameAR:json['ASR_A_LNAME'],
      fatherNameAR: json['ASR_A_FATHNAME'],
      birthdate: json['ASR_BIRTHDATE'],
      firstPhoneNumber: json['ASR_PHONE_1'],
      //firstAddress: json['ASR_ADR_1'],
      identityNumber: json['ASR_IDENTNUM'],



  );
  }
  Map<String,dynamic>toJson()=>{
    //"OFF_CATEGORY":category,
    "ASR_FNAME":firstName,
    "ASR_LNAME":lastName,
    "ASR_FATHNAME":fatherName,
    "ASR_SEX":gender,
    "ASR_A_FNAME":firstNameAR,
    "ASR_A_LNAME":lastNameAR,
    "ASR_A_FATHNAME":fatherNameAR,
    "ASR_BIRTHDATE":birthdate,
    "ASR_PHONE_1":firstPhoneNumber,
    //"ASR_ADR_1":firstAddress,
    "ASR_IDENTNUM":identityNumber


  };
}