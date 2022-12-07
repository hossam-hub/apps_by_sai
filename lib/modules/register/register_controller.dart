import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/register/register_service.dart';

class RegisterController extends GetxController{
  bool checked=false;
  final registerKey=GlobalKey<FormState>();
  var isLoading=false.obs;
  late TextEditingController fNameController,lNameController,userCodeController,passwordController,confirmPasswordController;
  String name='',password='',userLevel='u';
  final storage = const FlutterSecureStorage();


  @override
  void onInit() {
    fNameController=TextEditingController();
    lNameController=TextEditingController();
    userCodeController=TextEditingController();
    passwordController=TextEditingController();
    confirmPasswordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    userCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validatePassword(String value){
    if (value.length<8){
      return "Password must be more than 7 litters";
    }
    return null;
  }
  String? validate(String value,String name){
    if (value.isEmpty){
      return "$name Can not be empty";
    }
    return null;
  }
  String? confirmValidate(String value){
    if (value!=passwordController.text){
      return "Wrong Password";
    }
    return null;
  }
  doRegister()async{
    bool isValidate=registerKey.currentState!.validate();
    if(isValidate){
      isLoading(true);
      try{
        var data =await RegisterService.register(
            userCode: userCodeController.text,
            fName: fNameController.text,
            lName: lNameController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            userLevel: checked?'m':'u',

        );
        if(data!=null){
          await storage.write(key: "name", value: data.user.fName);
          await storage.write(key: "token", value: data.token);
          registerKey.currentState!.save();
          Get.back();
          Get.snackbar(
              "Register",
              "Registered Successfully",
              colorText: Colors.green,
              snackPosition: SnackPosition.BOTTOM
          );

        }else{
          Get.snackbar("Register", "Register Filed",colorText: Colors.red);
        }
      }finally{
        isLoading(false);

      }
    }
  }
  void userLevelToggle() {
    checked=!checked;
    update();
}
}