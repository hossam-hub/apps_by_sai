class AgeCalculator{
  static var  age;

  DateTime now =DateTime.now();
  AgeCalculator(DateTime birthdate){
    if(birthdate.year==now.year){
      if(birthdate.month==now.month){
        if(birthdate.day>13){
          age='${now.day-birthdate.day}day';
        }

      }else{
        age='${now.month-birthdate.month}  month';
      }
    }
    else{
      age='${now.year-birthdate.year}''  year';
    }
  }
}