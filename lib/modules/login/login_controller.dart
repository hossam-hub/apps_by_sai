import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/login/login_service.dart';


class LoginController extends GetxController{
  bool visible=true;
  int tryTime=0;
  final loginKey=GlobalKey<FormState>();
  var isLoading=false.obs;
  late TextEditingController userCodeController,passwordController;
  String userCode='',password='';
  final storage = const FlutterSecureStorage();


  @override
  void onInit() {
    userCodeController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    userCodeController.dispose();
    passwordController.dispose();
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

  doLogin()async{
    bool isValidate=loginKey.currentState!.validate();
    if(isValidate){
      isLoading(true);
      try{
        var data =await LoginService.login(
          userCode: userCodeController.text,
          password: passwordController.text,
        );
        if(data!=null){
          await storage.write(key: "name", value: data.user.fName);
          await storage.write(key: "token", value: data.token);
          loginKey.currentState!.save();
          Get.toNamed('/home');
          // Get.snackbar(
          //           //     "Login",
          //           //     "Login Successfully",
          //           //     colorText: Colors.green,
          //           //     snackPosition: SnackPosition.BOTTOM
          //           // )

        }else{
          Get.snackbar("Login", "Login Filed",colorText: Colors.red);
        }
      }finally{
        isLoading(false);

      }
    }
  }

  void changeVisibilityState(){
    visible?visible=false:visible=true;
    update();
  }
  void tryCounter(){
    tryTime++;
    update();
  }
}