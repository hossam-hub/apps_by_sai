import 'package:fluent_ui/fluent_ui.dart';
import 'package:sai_app/modules/medical_request/form_Page.dart';
import 'package:sai_app/modules/medical_request/form_item.dart';

class MemberItem{
  FormPage form;
  DateTime birthdate;
  MemberItem(this.form,this.birthdate);
}


class MemberPage extends StatelessWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

      ],
    );
  }
}
