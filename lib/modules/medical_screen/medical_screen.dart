import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalScreen extends StatelessWidget {
  const MedicalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[200],

              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.1,
              child: Row(
                children: [
                  IconButton(onPressed:(){
                    Get.back();
                  } , icon:Icon(Icons.arrow_back)),
                  Text('user name:')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){

            },
            child: Card(
              color: Colors.white,
              elevation: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*.8,
                height: 40,
                child: Center(
                    child: Text(
                        'Medical Request ')
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){

            },
            child: Card(
              color: Colors.white,
              elevation: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*.8,
                height: 40,
                child: const Center(
                    child: Text(
                        'Medical Calculater')
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
