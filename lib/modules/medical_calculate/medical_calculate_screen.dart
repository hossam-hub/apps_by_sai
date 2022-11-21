import 'package:fluent_ui/fluent_ui.dart';
import 'package:sai_app/modules/medical_calculate/calculate_age.dart';
import 'package:sai_app/modules/medical_calculate/date_model.dart';

class MedicalCalculateScreen extends StatefulWidget {
  const MedicalCalculateScreen({Key? key}) : super(key: key);

  @override
  State<MedicalCalculateScreen> createState() => _MedicalCalculateScreenState();
}

class _MedicalCalculateScreenState extends State<MedicalCalculateScreen> {
  DateTime selected=DateTime.now();
  int numberOfFamily=0;
  List<DateModel> ages=[

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Enter the number oo family members :         '),
              Row(
                children: [
                  IconButton(
                      icon: Icon(FluentIcons.calculator_subtract),

                      onPressed: (){
                    setState(() {
                      if(numberOfFamily>0) {
                        numberOfFamily-- ;
                        ages.removeLast();
                      }

                    });
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text('$numberOfFamily'),
                    ),
                  ),
                  IconButton(icon: Icon(FluentIcons.add), onPressed: (){
                    setState(() {
                      numberOfFamily++;
                      ages.add(DateModel(birthDate: DateTime.now(), age: ''));
                    });
                  })
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.8,
          child: ListView.separated(
              itemBuilder: (context,index)=>buildBirthDate(index),
              separatorBuilder: (context,index)=>SizedBox(height: 10,),
              itemCount: numberOfFamily),
        ),
      ],
    );
  }

  Widget buildBirthDate(int index)=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: [
      DatePicker(
      header: 'Birth date is:',
      selected: ages[index].birthDate,
      onChanged: (time) => setState(() {
        selected = time;
        if(DateTime.now().year>=time.year) {
                AgeCalculator(selected);
                ages[index].age=AgeCalculator.age;
                ages[index].birthDate=time;
              }
            }),
      ),
      Column(
        children: [
          const Text('Age is'),
          Container(
            margin: EdgeInsets.only(top: 0),
            color: Colors.white,
            width: 60,
            height: 35,
            child: Card(
              padding: EdgeInsets.zero,
              child: Center(
                child: Text(
                    '${ages[index].age}',
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
