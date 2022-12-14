import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import 'package:sai_app/modules/medical_request/medical_request_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';


class MedicalRequestScreen extends StatelessWidget {


   MedicalRequestController controller =Get.put(MedicalRequestController());

  MedicalRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              FilledButton(child: const Text('Add New Request'), onPressed: (){
                Get.defaultDialog(
                  title: 'New Request',
                  content: Form(
                    key: controller.formKey1,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.7,
                      height: MediaQuery.of(context).size.height*.7,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.7,
                            height: MediaQuery.of(context).size.height*.6,
                            child: FluentTheme(
                              data: ThemeData.light(),
                              child: GridView(
                                  gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: MediaQuery.of(context).size.width/ 3,
                                  mainAxisExtent: 70,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10
                                  ),
                                  children: [
                                    TextFormBox(
                                      header: 'First Name:',
                                      controller: controller.firstNameARController,
                                      validator:(value){
                                        return controller.validate(value!, "First Name");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'Last Name:',
                                      controller: controller.lastNameARController,
                                      validator:(value){
                                        return controller.validate(value!, "Last Name");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'Father Name:',
                                      controller: controller.fatherNameARController,
                                      validator:(value){
                                        return controller.validate(value!, "Father Name");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'First Name in English:',
                                      controller: controller.firstNameController,
                                      validator:(value){
                                        return controller.validate(value!, "First Name");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'Last Name in English:',
                                      controller: controller.lastNameController,
                                      validator:(value){
                                        return controller.validate(value!, "Last Name");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'Father Name in English:',
                                      controller: controller.fatherNameController,
                                      validator:(value){
                                        return controller.validate(value!, "father Name");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'First Phone Number:',
                                      controller: controller.firstPhoneNumberController,
                                      validator:(value){
                                        return controller.validateNumber(value!, "Phone Number");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'First Address :',
                                      controller: controller.firstAddressController,
                                      validator:(value){
                                        return controller.validate(value!, "Address");
                                      } ,
                                    ),
                                    TextFormBox(
                                      header: 'ID Number:',
                                      controller: controller.identityNumberController,
                                      validator:(value){
                                        return controller.validateNumber(value!, "ID Number");
                                      } ,
                                    ),
                                    DateTimePicker(
                                      validator: (v){
                                        return controller.validate(v!, 'Birthdate');

                                      },
                                      dateMask:  '  yyyy/MMM/d',
                                        controller: controller.birthdateController,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        dateLabelText: 'Birthdate',
                                        onChanged: (val) {},
                                       onSaved:(v){

                                       } ,
                                      onEditingComplete: (){
                                      },

                                    ),
                                    GetBuilder<MedicalRequestController>(
                                        builder: (controller)=>Row(
                                          children: [
                                      const Text(
                                          'Male'
                                      ),
                                      Checkbox(
                                          checked: controller.isChecked,
                                          onChanged: (value){
                                            controller.changeGender();
                                            controller.genderController.text='m';
                                            //print(controller.genderController.text);
                                          }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                          'Female'
                                      ),
                                      Checkbox(
                                          checked: !controller.isChecked,
                                          onChanged: (value){
                                            controller.changeGender();
                                            controller.genderController.text='f';
                                            //print(controller.genderController.text);
                                          }),
                                    ],)
                                    ),

                                  ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                confirm: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: FluentTheme(
                            data: ThemeData.light(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Button(
                                    child: SizedBox(
                                        width: MediaQuery.of(context).size.width*.7/ 3,
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
                                        width: MediaQuery.of(context).size.width*.7/ 3,
                                        child: const Center(child: Text('Submit')
                                        )
                                    ),
                                    onPressed: () {
                                      controller.doAddInsured();
                                      // print(controller.birthdateController.text+'|'+
                                      //     controller.genderController.text+'|'+
                                      //     controller.identityNumberController.text+'|'+
                                      //     controller.firstNameARController.text+'|'+
                                      //     controller.firstNameController.text+'|'+
                                      //     controller.lastNameController.text+'|'+
                                      //     controller.lastNameARController.text+'|'+
                                      //     controller.fatherNameController.text+'|'+
                                      //     controller.fatherNameARController.text+'|'+
                                      //     controller.firstAddressController.text+'|'+
                                      //     controller.firstPhoneNumberController.text+'|'
                                      // );
                                    }
                                    ),
                              ]
                            )
                          )
                )
                );
              })
            ],
          ),
        ],
      ),
    );
  }
  Widget buildDatePicker(){
    return DateTimePicker(
      initialValue: '',
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      dateLabelText: 'Birthdate',
      onChanged: (val) => controller.birthdateController.text=val,

    );
  }
}









// class MedicalRequestScreen extends StatefulWidget {
//
//   @override
//   State<MedicalRequestScreen> createState() => _MedicalRequestScreenState();
// }
//
// class _MedicalRequestScreenState extends State<MedicalRequestScreen> {
//  MedicalRequestController mController=Get.put(MedicalRequestController());
//
//   List<AccentColor> colors =
//       List.generate(8, (index) => Colors.accentColors[index]);
//
//   List<FormPage> allMembers=[
//     FormPage(),
//   ];
//   List<InsuredModel>insuredRequest=[
//     InsuredModel(insured:Insured(
//         firstNameAR: 'اشي',
//         lastNameAR: 'يلبيل',
//         fatherNameAR: 'بيلبيل',
//         firstPhoneNumber: '75676',
//         firstAddress: 'يسبليلل',
//         gender: 'ذكر',
//         birthdate: '2000/4/1',
//         identityNumber: '151515'
//     ),
//     ),
//
//   ];
//
//   final pageController = PageController();
//
//   int numOfPages = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     double dialogWidth = MediaQuery.of(context).size.width * .5;
//     return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Button(
//                     child: const Text('Add New Request'),
//                     onPressed: (){
//                       Get.defaultDialog(
//                         title: 'New Request',
//                         content: FluentTheme(
//                             data: ThemeData.light(),
//                             child: SizedBox(
//                               width: dialogWidth,
//                               height: MediaQuery.of(context).size.height * .5,
//                               child: Form(
//                                 child: FormPage(),
//                               ),
//                             )),
//                         confirm: Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: FluentTheme(
//                             data: ThemeData.light(),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Button(
//                                     child: SizedBox(
//                                         width: dialogWidth / 3,
//                                         child: const Center(child: Text('Cancel')
//                                         )
//                                     ),
//                                     onPressed: () {
//                                       Get.back();
//                                     }),
//                                 Obx(() =>  mController.isLoading.value==true?
//                                 const ProgressRing():
//                                 const Text("")
//                                 ),
//                                 FilledButton(
//                                     child: SizedBox(
//                                         width: dialogWidth / 3,
//                                         child: const Center(child: Text('Submit')
//                                         )
//                                     ),
//                                     onPressed: () {
//                                       if (mController.formKey1.currentState!
//                                           .validate()){
//                                         insuredRequest.add(
//                                             InsuredModel(
//                                                 insured: Insured(
//                                                     firstNameAR: FormItems.firstNameAR.data,
//                                                     lastNameAR: FormItems.lastNameAR.data,
//                                                     fatherNameAR: FormItems.fatherNameAR.data,
//                                                     firstPhoneNumber: FormItems.firstPhoneNumber.data,
//                                                     firstAddress: FormItems.firstAddressNumber.data,
//                                                     gender: FormItems.gender.data,
//                                                     birthdate: '',
//                                                     identityNumber: ''
//                                                 )
//                                             )
//                                         );
//                                         Get.back();
//                                         Get.snackbar("Request Added", "Successfully");
//
//                                       }
//
//                                     }
//                                     ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                 ),
//
//               ],
//             ),
//             Container(
//               color: Colors.blue,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height*.7,
//               child: ListView.builder(
//                   itemCount: insuredRequest.length,
//                   itemBuilder: (context,index)=>Card(
//                       child: Container(
//                         //color: Colors.red,
//                         width: MediaQuery.of(context).size.width*.8,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text('Insured Name :${insuredRequest[index].insured.firstNameAR}'),
//                             Text('Request Number : $index')
//                           ],
//                         ),
//                       )
//                   )
//               ),
//             )
//           ],
//         ),
//     );
//   }
// }





// PageView.builder(
// itemCount: numOfPages,
// controller: pageController,
// physics: const NeverScrollableScrollPhysics(),
// scrollDirection: Axis.vertical,
// itemBuilder: (context, index) => Container(
// margin: const EdgeInsets.all(20),
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height*.6,
// child: Column(
//
// children: [
// if (index == 0)
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// const Text('The Number of Family Member:'),
// Card(
// child: Row(
// children: [
// IconButton(
// icon: const Icon(FluentIcons.calculator_subtract),
// onPressed: () {
// setState(() {
// if (numOfPages > 1) {
// numOfPages--;
// allMembers.removeLast();
// }
// });
// }),
// Container(
// decoration:
// BoxDecoration(borderRadius: BorderRadius.circular(20)),
// child: Center(
// child: Text('$numOfPages'),
// ),
// ),
// IconButton(
// icon: const Icon(FluentIcons.add),
// onPressed: () {
// setState(() {
// numOfPages++;
// allMembers.add( FormPage());
// mController.keys.add(GlobalKey());
// mController.keyNum++;
// });
// }),
// ],
// ),
// )
//
// ],
// ),
// if(index !=0)
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Member:$index')
// ],
// ),
// Expanded(
// flex: 2,
// child:allMembers[index] ,
// ),
// // Expanded(
// //   flex: 1,
// //   child: Row(
// //     mainAxisAlignment: MainAxisAlignment.end,
// //     children: [
// //       DatePicker(selected: DateTime.now()),
// //     ],
// //   ),
// // ),
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// FilledButton(
// style: ButtonStyle(backgroundColor: ButtonState.all(Colors.green)),
// onPressed: () {
// pageController.previousPage(
// duration: const Duration(seconds: 1),
// curve: Curves.decelerate);
// },
// child: Row(
// children: const [
// Icon(FluentIcons.chrome_back),
// SizedBox(width: 10,),
// Text('Previous'),
// ],
// ),
// ),
// const SizedBox(width: 10,),
// FilledButton(
// style: ButtonStyle(backgroundColor: ButtonState.all(Colors.green)),
// onPressed: () {
// if (mController.formKey1.currentState!.validate()) {
// pageController.nextPage(
// duration: const Duration(seconds: 1),
// curve: Curves.linear);
// }
// },
// child: Row(
// children: const [
// Text('Next'),
// SizedBox(width: 10,),
// Icon(FluentIcons.chrome_back_mirrored),
// ],
// ),
// ),
// ],
// )
// ],
// ),
// ),
// )