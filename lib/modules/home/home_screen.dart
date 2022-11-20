import 'package:fluent_ui/fluent_ui.dart';
//import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: EdgeInsets.all(10),
            
          ),



          SizedBox(height: 10,),
          // Column(
          //   children: [
          //     InkWell(
          //       onTap: (){
          //         Get.toNamed("/medical");
          //       },
          //       child: Card(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(25)
          //         ),
          //         color: Colors.white,
          //         elevation: 20,
          //         child: Container(
          //           decoration: BoxDecoration(
          //             //borderRadius: BorderRadius.circular(300)
          //           ),
          //           width: 40,
          //           height: 40,
          //
          //         ),
          //       ),
          //     ),
          //     Center(
          //         child: Text(
          //             'medical')
          //     ),
          //   ],
          // )
        ],
      ),
    );

  }
}
