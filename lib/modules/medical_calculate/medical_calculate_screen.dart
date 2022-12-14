import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import 'package:sai_app/modules/medical_calculate/medical_calculate_controller.dart';

class MedicalCalculateScreen extends StatelessWidget {

MedicalCalculateController controller=Get.put(MedicalCalculateController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Enter the number of family members :         '),
              Row(
                children: [
                  IconButton(
                      icon: Icon(FluentIcons.calculator_subtract),

                      onPressed: (){
                      controller.subItem();
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: GetBuilder<MedicalCalculateController>(
                        builder: (controller)=>Text('${controller.numberOfFamily}'),
                      )
                    ),
                  ),
                  IconButton(icon: Icon(FluentIcons.add), onPressed: (){
                    controller.addItem();
                  })
                ],
              ),
            ],
          ),
        ),
        Form(
          key: controller.ageFormKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.7,
            child: GetBuilder<MedicalCalculateController>(
              builder: (controller)=>ListView.separated(
                  itemBuilder: (context,index)=>buildBirthDate(index),
                  separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                  itemCount: controller.numberOfFamily),
            )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GetBuilder<MedicalCalculateController>(
                builder: (controller)=>Text(
                    controller.result+'SP')
            ),
            controller.isLoading.value?Obx(() => ProgressRing()):Text(''),
            FilledButton(
                child: const Text('Calculate'),
                onPressed: (){
                  controller.doCalculate();
                }
            ),
          ],
        ),
      ],
    );
  }

 Widget buildBirthDate(int index){
    return Card(
        child: GetBuilder<MedicalCalculateController>(
          builder: (controller)=>Row(
            children: [
              const Text('enter birthdate:'),
              DatePicker(
                selected: controller.ages[index].birthDate,
                onChanged: (value){
                 controller.pickDate(value,index);
                },
              ),
              Text('Age is :${controller.ages[index].age}'),

            ],
          ),
        )
    );
 }
}



// Widget buildBirthDate(int index)=> Card(
//   backgroundColor: Colors.blue.light,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       const Text('Birth date is:'),
//       Container(
//         width: 50,
//         height: 50,
//
//       ),
//       SizedBox(
//         width: 200,
//         height: 70,
//         child: TextFormBox(
//           controller: controller.ages[index].textController,
//           readOnly: true,
//         ),
//       ),
//       Column(
//         children: [
//           const Text('Age is'),
//           Container(
//             margin: const EdgeInsets.only(top: 0),
//             color: Colors.white,
//             width: 60,
//             height: 35,
//             child: Card(
//               padding: EdgeInsets.zero,
//               child: Center(
//                 child: Text(
//                   '',
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )
//     ],
//   ),
// );
//