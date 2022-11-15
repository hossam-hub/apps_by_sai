import 'package:flutter/material.dart';
import 'package:sai_app/components/text_field.dart';

import '../../components/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*.8,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 90,),
              NormalTextField(
                  icon: Icons.person,
                  hint: "User Name",
                  keyBoard: TextInputType.emailAddress,
                  ontap: (value) {}),
              NormalTextField(
                  icon: Icons.lock,
                  hint: "Password",
                  keyBoard: TextInputType.visiblePassword,
                  ontap: (value) {}),
              const SizedBox(height: 10,),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     borderRadius: BorderRadius.circular(30)
              //   ),
              //   // child: MaterialButton(
              //   //   color: Colors.green,
              //   //   child:const Text("Login") ,
              //   //   //shape: CircleBorder(side:BorderSide. ),
              //   //   onPressed: (){}
              //   // ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      child: MyCustomWidget(),
                    width: 150,
                    height: 50,
                  ),
                ],
              )
            ],

          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
