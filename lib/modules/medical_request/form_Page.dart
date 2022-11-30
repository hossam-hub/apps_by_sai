import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import 'form_item.dart';
import 'medical_request_controller.dart';

class FormItems {
  static  FormItem firstName = FormItem('First Name :', FluentIcons.contact,'');
  static FormItem lastName = FormItem('Last Name :', FluentIcons.contact,'');
  static FormItem firstNameAR = FormItem(
    'First Name Arabic :', FluentIcons.contact,'');
  static FormItem lastNameAR = FormItem('Last Name Arabic :', FluentIcons.contact,'');
  static FormItem fatherName = FormItem('Father Name :', FluentIcons.contact,'');
  static FormItem fatherNameAR = FormItem('Father Name Arabic :', FluentIcons.contact,'');
  static FormItem firstPhoneNumber = FormItem('First Phone Number :', FluentIcons.phone,'');
  static FormItem secondPhoneNumber = FormItem('Second Phone Number(Optional) :', FluentIcons.phone,'');
  static FormItem firstAddressNumber = FormItem('First Address Number :', FluentIcons.title,'');
  static FormItem secondAddressNumber = FormItem('second Address Number(Optional) :', FluentIcons.title,'');
  static FormItem gender = FormItem('Gender :', FluentIcons.transition,'');

  static  List<FormItem> all = [
    firstName,
    lastName,
    firstNameAR,
    lastNameAR,
    fatherName,
    fatherNameAR,
    firstPhoneNumber,
    secondPhoneNumber,
    firstAddressNumber,
    secondAddressNumber,
    gender
  ];
}

class FormPage extends StatelessWidget {
  MedicalRequestController mController=Get.put(MedicalRequestController());

  @override
  Widget build(BuildContext context) {
   TextEditingController tController=TextEditingController();

    return Form(
      key: mController.formKey1,
      child: GridView.builder(
        itemCount: FormItems.all.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width/ 2.5,
            mainAxisExtent: 70,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
          itemBuilder: (context, index)=>TextFormBox(

            validator: (value){
              if (value!.isEmpty&&(index!=7&&index!=9)) {
                return '${FormItems.all[index].title} must not be empty';
              }
              return null;
            },
            onChanged: (value){

              FormItems.all[index].data=value;
            },
            header: FormItems.all[index].title,
            suffix: Icon(FormItems.all[index].icon),
          ),
      ),
    );
  }



}
