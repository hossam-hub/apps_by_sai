import 'package:fluent_ui/fluent_ui.dart';
class FormModel {
  String header;
  bool security;
  String formController;

  FormModel({
    required this.header,
     this.security=false,
    this.formController=''

});
}