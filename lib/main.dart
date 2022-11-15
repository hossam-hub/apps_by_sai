//import 'package:fluent_ui/fluent_ui.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sai_app/modules/login/login1.dart';
import 'package:get/get.dart';
import 'package:desktop_window/desktop_window.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await DesktopWindow.setMinWindowSize(Size(500, 850));
    await DesktopWindow.setWindowSize(Size(300,340));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => LoginScreen()),
        //GetPage(name: "/login", page: () => MyCustomWidget()),
      ],
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//
//       ),
//     );
//   }
// }
