
import 'dart:convert';

CalculateModel calculateFromJson(String str)=>CalculateModel.toObject(json.decode(str));


class CalculateModel{
  Calculator data;
  CalculateModel({required this.data});

  factory CalculateModel.toObject(Map<String,dynamic>json)=>
      CalculateModel(
          data: Calculator.toObject(json['data']),

      );

  Map<String,dynamic>toJson()=>{
    "data":data.toJson(),

  };
}

class Calculator{

  String sum;
  String fines;
  String total;

  Calculator({
    required this.sum,
    required this.fines,
    required this.total,
  });

  factory Calculator.toObject(Map<String,dynamic> json)=>Calculator(
      sum: json['sum'],
      fines: json['fines'],
      total: json['total'],


  );
  Map<String,dynamic>toJson()=>{
    "sum":sum,
    "fines":fines,
    "total":total,


  };
}