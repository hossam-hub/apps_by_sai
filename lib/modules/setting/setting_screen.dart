import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import '../register/register_controller.dart';

class SettingScreen extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());

  // List<FormModel> formData = [
  //   FormModel(
  //       header: 'User First Name:', formController: controller.fNameController.text),
  //   FormModel(
  //       header: 'User Last Name:', formController: TextEditingController()),
  //   FormModel(header: 'User Code:', formController: TextEditingController()),
  //   FormModel(
  //       header: 'Password:',
  //       security: true,
  //       formController: TextEditingController()),
  //   FormModel(
  //       header: 'Confirm Password:',
  //       security: true,
  //       formController: TextEditingController())
  // ];

  @override
  Widget build(BuildContext context) {
    double dialogWidth = MediaQuery.of(context).size.width * .5;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilledButton(
            child: SizedBox(
                width: dialogWidth / 2,
                height: MediaQuery.of(context).size.height * .1,
                child: const Center(
                    child: Text(
                  'Add User',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )
                )
            ),
            onPressed: () {
              Get.defaultDialog(
                title: 'Add User',
                content: FluentTheme(
                    data: ThemeData.light(),
                    child: SizedBox(
                      width: dialogWidth,
                      height: MediaQuery.of(context).size.height * .5,
                      child: Form(
                        key: controller.registerKey,

                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: dialogWidth / 2,
                                  mainAxisExtent: 70,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          children: [
                            TextFormBox(
                              header: 'User First Name:',
                              controller: controller.fNameController,
                              validator: (value) {
                                return controller.validate(
                                    value!, "User First Name");
                              },
                            ),
                            TextFormBox(
                              header: 'User Last Name:',
                              controller: controller.lNameController,
                              validator: (value) {
                                return controller.validate(
                                    value!, "User Last Name");
                              },
                            ),
                            TextFormBox(
                              header: 'User Code:',
                              controller: controller.userCodeController,
                              validator: (value) {
                                return controller.validate(value!, "User Code");
                              },
                            ),
                            TextFormBox(
                              header: 'Password :',
                              controller: controller.passwordController,
                              obscureText: true,
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },
                            ),
                            TextFormBox(
                              header: 'Confirm Password:',
                              controller: controller.confirmPasswordController,
                              obscureText: true,
                              validator: (value) {
                                return controller.confirmValidate(value!);
                              },
                            ),
                            GetBuilder<RegisterController>(
                                builder: (controller)=>Row(
                              children: [
                                Checkbox(
                                    content: const Text('User'),
                                    checked:!controller.checked,
                                    onChanged:(v){
                                      controller.userLevelToggle();
                                    }
                                ),
                                Checkbox(
                                    content: const Text('Admin'),
                                    checked: controller.checked,
                                    onChanged: (t){
                                      controller.userLevelToggle();
                                    }
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    )),
                confirm: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FluentTheme(
                    data: ThemeData.light(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                            child: SizedBox(
                                width: dialogWidth / 3,
                                child: const Center(child: Text('Cancel')
                                )
                            ),
                            onPressed: () {
                              Get.back();
                            }),
                        Obx(() =>  controller.isLoading.value==true?
                        const ProgressRing():
                        const Text("")
                        ),
                        FilledButton(
                            child: SizedBox(
                                width: dialogWidth / 3,
                                child: const Center(child: Text('Register')
                                )
                            ),
                            onPressed: () {
                              if (controller.registerKey.currentState!
                                  .validate()) {
                                controller.doRegister();
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20,),
          FilledButton(
              child:SizedBox(
                width: dialogWidth / 2,
                height: MediaQuery.of(context).size.height * .1,
                child: const Center(
                  child:  Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
                ),
              ), onPressed: (){
            Get.offAllNamed('/login');
          })
        ],
      ),
    );
  }
}
