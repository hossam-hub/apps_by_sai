import 'package:fluent_ui/fluent_ui.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title:const Text(
            "MY APP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: Row(
          children: [
            Spacer(),
            OutlinedButton(
                onPressed:(){} ,
                child: Text('Create')
            ),
          ],
        ),
      ),
      pane:NavigationPane(
        items:[
          PaneItem(icon: Icon(FluentIcons.to_do_logo_outline), body: Text('to do'))
        ]
    ),
    );
    //   Scaffold(
    //
    //   body: Center(
    //     child: Column(
    //       children: [
    //         Card(
    //           elevation: 30,
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Colors.green[200],
    //
    //             ),
    //             width: double.infinity,
    //             height: MediaQuery.of(context).size.height*.1,
    //             child: Row(
    //               children: [
    //                 Text('user name:')
    //               ],
    //             ),
    //           ),
    //         ),
    //
    //
    //
    //         SizedBox(height: 10,),
    //         Column(
    //           children: [
    //             InkWell(
    //               onTap: (){
    //                 Get.toNamed("/medical");
    //               },
    //               child: Card(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(25)
    //                 ),
    //                 color: Colors.white,
    //                 elevation: 20,
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     //borderRadius: BorderRadius.circular(300)
    //                   ),
    //                   width: 40,
    //                   height: 40,
    //
    //                 ),
    //               ),
    //             ),
    //             Center(
    //                 child: Text(
    //                     'medical')
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
