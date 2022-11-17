import 'package:get/get.dart';

class LoginController extends GetxController{

  bool visible=true;
  int tryTime=0;

  void changeVisibilityState(){
    visible?visible=false:visible=true;
    update();
  }
  void tryCounter(){
    tryTime++;
    update();
  }
}