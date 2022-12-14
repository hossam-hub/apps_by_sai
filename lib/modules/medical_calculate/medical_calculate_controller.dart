import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/medical_calculate/medical_calculate_service.dart';
import 'date_model.dart';

class MedicalCalculateController extends GetxController{
  String result='';
  var isLoading=false.obs;
  GlobalKey<FormState>ageFormKey=GlobalKey();
  TextEditingController birthdate=TextEditingController();
  DateTime selected=DateTime.now();
  int numberOfFamily=0;
  List<DateModel> ages=[];

 void subItem (){
   if(numberOfFamily>0) {
     numberOfFamily-- ;
     ages.removeLast();
     update();
   }
 }
 void addItem(){
   numberOfFamily++;
   ages.add(
       DateModel(
           birthDate: DateTime.now(),
           textController: birthdate,
           )
   );
   update();
 }
 void pickDate(DateTime value,int index){
   ages[index].birthDate=value;
   ages[index].textController.text=value.toString();
   ages[index].AgeCalculator();
   update();
 }



 doCalculate()async{
   bool isValidate=ageFormKey.currentState!.validate();
   if(isValidate){
     isLoading(true);
     try{
       List <int>ages1=List.generate(ages.length, (index) => ages[index].age1);
       var data= await MedicalCalculateService.calculate(
            age:ages1
       );
       if(data!=null){
         result=data.data.total;
         update();
         print(result);
         print(data.data.sum);
         print(data.data.fines);
         Get.snackbar(
             "Successfully",
             " Successfully",
             colorText: Colors.green,
             snackPosition: SnackPosition.BOTTOM
         );

       }
     }finally{
       isLoading(false);
     }
   }
 }
}