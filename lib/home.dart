import 'package:fluent_ui/fluent_ui.dart';
import 'package:sai_app/modules/home/home_screen.dart';
import 'package:sai_app/modules/medical_calculate/medical_calculate_screen.dart';
import 'package:sai_app/modules/medical_screen/medical_screen.dart';
import 'package:sai_app/modules/setting/setting_screen.dart';

import 'modules/medical_request/medical_request_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int topIndex=0;
  @override
  Widget build(BuildContext context) {

    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: NavigationView(

        appBar:  NavigationAppBar(
          height: MediaQuery.of(context).size.height*.15,
          backgroundColor: Colors.green.lightest,
          title: const Text('My App',style: TextStyle(fontWeight: FontWeight.bold),),
          actions: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
               Card(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                      child: Text(
                        'User Name:',
                        style: TextStyle(
                            fontSize:10 ,
                            color: Colors.grey),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        pane: NavigationPane(
          size: NavigationPaneSize(openMaxWidth: MediaQuery.of(context).size.width*.25),
          selected: topIndex,

          onChanged: (index) => setState(() => topIndex = index),
          displayMode: PaneDisplayMode.auto,
          items: [
            PaneItem(
              onTap: (){setState(() {
              });},
              icon: const Icon(FluentIcons.home),
              title: const Text('Home'),
              body: HomeScreen(),
            ),

            PaneItemExpander(
              icon: const Icon(FluentIcons.heart),
              title: const Text('Medical'),
              body: MedicalScreen(),
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.mail),
                  title: const Text('Medical Request'),
                  body: MedicalRequestScreen(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.calculator),
                  title: const Text('Medical Calculator'),
                  body: MedicalCalculateScreen(),
                ),

              ],
            ),
          ],
          footerItems:
          [
            PaneItem(
              onTap: (){
                setState(() {
              });},
              icon: const Icon(FluentIcons.settings),
              title: const Text('Settings'),
              body: SettingScreen(),
            ),
          ]
        ),
      ),

    );
  }
}
