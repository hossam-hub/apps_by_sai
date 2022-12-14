import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/medical_request/add_insured_service.dart';

class MedicalRequestController extends GetxController {
  DateTime selected=DateTime.now();
  bool isChecked=true;
  var formKey1 = GlobalKey<FormState>();
  var isLoading = false.obs;
  int keyNum = 0;

  late TextEditingController
      firstNameController,
      lastNameController,
      fatherNameController,
      genderController,
      firstNameARController,
      lastNameARController,
      fatherNameARController,
      birthdateController,
      firstPhoneNumberController,
      firstAddressController,
      identityNumberController,
      categoryController;



  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    fatherNameController = TextEditingController();
    genderController = TextEditingController();
    firstNameARController = TextEditingController();
    lastNameARController = TextEditingController();
    fatherNameARController = TextEditingController();
    birthdateController = TextEditingController();
    firstAddressController = TextEditingController();
    firstPhoneNumberController = TextEditingController();
    identityNumberController = TextEditingController();
    categoryController=TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    genderController.text='m';
    categoryController.text='m';
    super.onReady();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    fatherNameController.dispose();
    genderController.dispose();
    firstNameARController.dispose();
    lastNameARController.dispose();
    fatherNameARController.dispose();
    birthdateController.dispose();
    firstAddressController.dispose();
    firstPhoneNumberController.dispose();
    identityNumberController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  String? validate(String value,String name){
    if (value.isEmpty){
      return "$name Can not be empty";
    }
    return null;
  }
  String? validateNumber(String value,String name){
    if (!GetUtils.isNum(value)||value.isEmpty){
      return "$name Must have only numbers!!";
    }
    return null;
  }


  doAddInsured() async {
    bool isValidate = formKey1.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        var data = await AddInsuredService.AddInsured(
            category: categoryController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            fatherName: fatherNameController.text,
            gender: genderController.text,
            firstNameAR: firstNameARController.text,
            lastNameAR: lastNameARController.text,
            fatherNameAR: fatherNameARController.text,
            birthdate: birthdateController.text,
            firstPhoneNumber: firstPhoneNumberController.text,
            firstAddress: firstAddressController.text,
            identityNumber: identityNumberController.text
        );
        if(data!=null){
          var id=data.insured.identityNumber;
          var fullName=data.insured.firstNameAR+data.insured.lastNameAR;
          print(id+fullName);
        }
      } finally {
        isLoading(false);
      }
    }
  }
  void changeGender(){
    isChecked?isChecked=false:isChecked=true;

    update();
  }
}