import 'package:fluent_ui/fluent_ui.dart';
class DateModel{
   DateTime birthDate;
   TextEditingController textController;


  DateModel({
    required this.birthDate,
    required this.textController
});

   DateTime now =DateTime.now();
   String age='';
   int age1=0;

   AgeCalculator(){
      DateTime birthdate=birthDate;
     if(birthdate.year==now.year){
       if(birthdate.month==now.month){
         if(birthdate.day>13){
           age='${now.day-birthdate.day}day';
         }

       }else{
         age='${now.month-birthdate.month}  month';
       }
     }
     else if(now.year-birthdate.year<66){
        age='${now.year-birthdate.year}''  year';
        age1=now.year-birthdate.year;
     }
   }
}