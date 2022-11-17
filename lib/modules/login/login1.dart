import 'package:flutter/material.dart';
import 'package:sai_app/components/text_field.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var userController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
            key: formKey,
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
                NormalTextField(
                    textController: userController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'user name must not be empty';
                      }
                      return null;
                    },
                    icon: Icons.person,
                    hint: "User Name",
                    keyBoard: TextInputType.emailAddress,
                    ontap: (value) {}),
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (controller) => NormalTextField(
                      textController: passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      security: controller.visible ? true : false,
                      icon: Icons.lock,
                      tailIcon: IconButton(
                        icon: controller.visible
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              ),
                        onPressed: () {
                          controller.changeVisibilityState();
                        },
                      ),
                      hint: "Password",
                      keyBoard: TextInputType.visiblePassword,
                      ontap: (value) {
                        value = userController.text;
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<LoginController>(
                    init: LoginController(),
                    builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(child: Text('${controller.tryTime}')),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: controller.tryTime < 3
                                  ? MaterialButton(
                                      child: const Text('Login'),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          Get.toNamed('/home');
                                        } else {
                                          controller.tryCounter();
                                        }
                                      },
                                    )
                                  : MaterialButton(
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
      backgroundColor: Colors.white,
    );
  }
}
