import 'package:fluent_ui/fluent_ui.dart';

class MedicalScreen extends StatefulWidget {
  const MedicalScreen({Key? key}) : super(key: key);

  @override
  State<MedicalScreen> createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
          child: CircleAvatar(
            backgroundColor: Colors.green,
          ),
              onPressed: () => showContentDialog(context),
            ),
          const Text('Medical Request')
        ],
      ),


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    const ContentDialog();
                  }),
              const Text('Medical calculate'),
            ],
          )
        ],
      ),
    )
    );
  }
  void showContentDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Medical Request'),
        content: Container(
          child: Column(
            children: [
              TextBox(),
              TextBox(),
              TextBox(),
            ],
          ),
        ),
        actions: [
          Button(
            child: const Text('Submit'),
            onPressed: () {
              Navigator.pop(context, 'User deleted file');
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'User canceled dialog'),
          ),
        ],
      ),
    );
    setState(() {});
  }
}
