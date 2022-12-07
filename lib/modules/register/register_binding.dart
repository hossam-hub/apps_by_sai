import 'package:get/get.dart';
import 'package:sai_app/modules/register/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}