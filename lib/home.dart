import 'package:fluent_ui/fluent_ui.dart';
import 'package:sai_app/modules/home/home_screen.dart';
import 'package:sai_app/modules/medical_calculate/medical_calculate_screen.dart';
import 'package:sai_app/modules/medical_screen/medical_screen.dart';
import 'package:sai_app/modules/setting/setting_screen.dart';

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
          title: Text('My App',style: TextStyle(fontWeight: FontWeight.bold),),
          actions: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(child: Text('User Name:',style: TextStyle(fontSize:10 ,color: Colors.grey),)),
                ),
              ],
            ),
          ),
        ),

        pane: NavigationPane(
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
              body: SettingScreen(),
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.mail),
                  title: const Text('Medical Request'),
                  body: SettingScreen(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.calculator),
                  title: const Text('Medical Calculator'),
                  body: MedicalCalculateScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
