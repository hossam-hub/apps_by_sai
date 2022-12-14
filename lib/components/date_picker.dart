import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';
import 'package:sai_app/modules/medical_request/medical_request_controller.dart';

class PickDate extends StatelessWidget {
  String value1='';

  @override
  Widget build(BuildContext context) {

    return DateTimePicker(
      initialValue: '2/7/2000',
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      dateLabelText: 'Birthdate',
      onChanged: (value){
        value1=value;
      },
      decoration: const InputDecoration(
        labelText: 'Birthdate',
        border: OutlineInputBorder(
          borderSide: BorderSide()
        )
      ),
    );
  }
}
