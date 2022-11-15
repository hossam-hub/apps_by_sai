
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType keyBoard;
  final Function(String)ontap;

  NormalTextField({
   required this.icon,
   required this.hint,
   required this.keyBoard,
   required this.ontap
});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 5) ,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green[200]
      ),
      child: TextFormField(
        onChanged: ontap,
        keyboardType: keyBoard,
        decoration: InputDecoration(
          icon: Icon(icon,color: Colors.black,),
          hintText: hint,
          border: InputBorder.none
        ),
      ),
    );
  }
}
