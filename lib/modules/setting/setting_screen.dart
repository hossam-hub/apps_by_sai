import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import 'form_model.dart';

class SettingScreen extends StatelessWidget {
  List<FormModel> formData = [
    FormModel(
        header: 'User First Name:', formController: TextEditingController()),
    FormModel(
        header: 'User Last Name:', formController: TextEditingController()),
    FormModel(header: 'User Code:', formController: TextEditingController()),
    FormModel(
        header: 'Password:',
        security: true,
        formController: TextEditingController()),
    FormModel(
        header: 'Confirm Password:',
        security: true,
        formController: TextEditingController())
  ];

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
            child:  SizedBox(
              width: dialogWidth/2,
                height: MediaQuery.of(context).size.height*.1,
                child: const Center(
                    child: Text(
                      'Add User',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
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
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: dialogWidth / 2,
                            mainAxisExtent: 50,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) => TextFormBox(
                          controller: formData[index].formController,
                          header: formData[index].header,
                          obscureText: formData[index].security,
                        ),
                        itemCount: formData.length,
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
                                child: const Center(child: Text('Cancel'))),
                            onPressed: () {
                              Get.back();
                            }),
                        FilledButton(
                            child: SizedBox(
                                width: dialogWidth / 3,
                                child: const Center(child: Text('Register'))),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              );
            },

          )
        ],
      ),
    );
  }
}
