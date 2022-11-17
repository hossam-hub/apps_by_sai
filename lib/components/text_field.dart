
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType keyBoard;
  final Function(String)ontap;
  TextEditingController textController;
  var tailIcon;
  bool security;
  var validator;


  NormalTextField({
   required this.icon,
   required this.hint,
   required this.keyBoard,
   required this.ontap,
   required this.textController,
    this.tailIcon,
    this.security=false,
    this.validator

});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 7),
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5) ,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green[200]
      ),
      child: TextFormField(
        controller: textController,
        validator: validator,
        onChanged: ontap,
        keyboardType: keyBoard,
        obscureText: security,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          //prefixIcon: Icon(icon,color: Colors.black,),
          suffix: tailIcon,
          icon: Icon(icon,color: Colors.black,),
          hintText: hint,
          border: InputBorder.none
        ),
      ),
    );
  }
}
