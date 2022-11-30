import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/medical_request/form_Page.dart';
import 'package:sai_app/modules/medical_request/medical_request_controller.dart';


class MedicalRequestScreen extends StatefulWidget {

  @override
  State<MedicalRequestScreen> createState() => _MedicalRequestScreenState();
}

class _MedicalRequestScreenState extends State<MedicalRequestScreen> {
 MedicalRequestController mController=Get.put(MedicalRequestController());

  List<AccentColor> colors =
      List.generate(8, (index) => Colors.accentColors[index]);

  List<FormPage> allMembers=[
    FormPage(),
  ];

  final pageController = PageController();

  int numOfPages = 1;

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemCount: numOfPages,
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.6,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(

          children: [
            if (index == 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('The Number of Family Member:'),
                  Card(
                    child: Row(
                      children: [
                        IconButton(
                            icon: const Icon(FluentIcons.calculator_subtract),
                            onPressed: () {
                              setState(() {
                                if (numOfPages > 1) {
                                  numOfPages--;
                                  allMembers.removeLast();
                                }
                              });
                            }),
                        Container(
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('$numOfPages'),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(FluentIcons.add),
                            onPressed: () {
                              setState(() {
                                numOfPages++;
                                allMembers.add( FormPage());
                              });
                            }),
                      ],
                    ),
                  )

                ],
              ),
            if(index !=0)
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Member:$index')
                ],
              ),
            Expanded(
              flex: 2,
              child:allMembers[index] ,
            ),
           Expanded(
             flex: 1,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 DatePicker(selected: DateTime.now()),
               ],
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               FilledButton(
                 style: ButtonStyle(backgroundColor: ButtonState.all(Colors.green)),
                 onPressed: () {
                   pageController.previousPage(
                       duration: const Duration(seconds: 1),
                       curve: Curves.decelerate);
                 },
                 child: Row(
                   children: const [
                     Icon(FluentIcons.chrome_back),
                     SizedBox(width: 10,),
                     Text('Previous'),
                   ],
                 ),
               ),
               const SizedBox(width: 10,),
               FilledButton(
                 style: ButtonStyle(backgroundColor: ButtonState.all(Colors.green)),
                 onPressed: () {
                   if (mController.formKey1.currentState!.validate()) {
                     pageController.nextPage(
                         duration: const Duration(seconds: 1),
                         curve: Curves.linear);
                   }
                 },
                 child: Row(
                   children: const [
                     Text('Next'),
                     SizedBox(width: 10,),
                     Icon(FluentIcons.chrome_back_mirrored),
                   ],
                 ),
               ),
             ],
           )
          ],
        ),
      ),
    );
  }
}
