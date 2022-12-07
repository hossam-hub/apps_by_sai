
import 'package:sai_app/components/text_field.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/login/login_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';

class LoginScreen extends StatelessWidget {

  LoginController controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return FluentTheme(
      data: ThemeData.light(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                key: controller.loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    TextFormBox(
                        controller: controller.userCodeController,
                        validator: (value) {
                          return controller.validate(value!,"User Code");
                        },
                    ),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) =>
                          TextFormBox(
                          controller: controller.passwordController,
                          validator: (value) {
                           return controller.validatePassword(value!);
                          },
                          obscureText: controller.visible ? true : false,
                            prefix: const Icon(FluentIcons.lock),
                            suffix: IconButton(
                              icon: controller.visible
                                  ?  Icon(
                                FluentIcons.view,
                                color: Colors.green,
                              )
                                  :  const Icon(
                                FluentIcons.view,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                controller.changeVisibilityState();
                              },
                            )

                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (controller) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(() =>  controller.isLoading.value==true?
                                const ProgressRing():
                                const Text("")
                                ),
                                const SizedBox(width: 10,),
                                Container(child: Text('${controller.tryTime}')),
                                const SizedBox(width: 10,),
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: controller.tryTime < 3
                                      ? Button(
                                          child: const Text('Login'),
                                          onPressed: () {
                                               // Get.toNamed('/home');
                                               if (controller.loginKey.currentState!
                                               .validate()) {
                                                 controller.doLogin();
                                               } else {
                                              controller.tryCounter();
                                            }
                                          },
                                        )
                                      : Button(
                                          onPressed: () {},
                                          child:const Text('Try Later'),
                                        ),
                                ),
                              ],
                            )),
                  ],
                ),
              ),
            ),
          ),
      ),
    );

  }
}
