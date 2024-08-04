import 'package:bmi/constants/app_constant.dart';
import 'package:bmi/screens/my_screen.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
 String wordResult = '';
  double result = 0;

  void calculate(a, b) {
    String heightText = heightController.text;
    String weightText = weightController.text;
    double? height = double.tryParse(heightText);
    double? weight = double.tryParse(weightText);


    // Example calculation
    if (height != null && weight != null && height > 0 && weight > 0) {
      setState(() {
        result = weight / (height * height);
      result = double.parse(result.toStringAsFixed(1));
      });
      bmi(result);
    }

  }

  void bmi(a){
    setState(() {
      if (a < 18.5) {
      wordResult = 'Жингийн дутагдалтай';
    } else if (a >= 18.5 && a < 24.9) {
      wordResult = 'Хэвийн жинтэй';
    } else if (a >= 25 && a < 29.9) {
      wordResult = 'Илүүдэл жинтэй';
    } else if (a >= 30) {
      wordResult = 'Таргалалттай';
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'BMI тооцоологч',
          style: TextStyle(color: Colors.yellow),
        ),
        leading: const FlutterLogo(),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyScreen()));
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/profile.JPG'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(
                  color: Colors.yellowAccent
                ),
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      borderSide: const BorderSide(color: Color.fromARGB(255, 226, 205, 15))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      borderSide: const BorderSide(color: Color.fromARGB(255, 226, 218, 144))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      borderSide: const BorderSide(color: Color.fromARGB(255, 143, 134, 51))),
                  prefix: const Text(
                    'Өндөр: ',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  suffix: const Text(
                    'см',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  label: const Text(
                    'Өндөр бичнэ үү',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  hintText: '170',
                  hintStyle: const TextStyle(color: Colors.white38),
                  icon: const Icon(
                    Icons.height,
                    color: Colors.yellow,
                  ),
                  fillColor: Colors.black,
                  filled: true
                ),
              ),
              SizedBox(
                height: height*0.05
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.yellowAccent
                ),
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      borderSide: const BorderSide(color: Color.fromARGB(255, 226, 205, 15))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      borderSide: const BorderSide(color: Color.fromARGB(255, 226, 218, 144))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      borderSide: const BorderSide(color: Color.fromARGB(255, 143, 134, 51))),
                  prefix: const Text(
                    'Жин:',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  suffix: const Text(
                    'кг',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  label: const Text(
                    'Жин бичнэ үү',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  hintText: '70',
                  hintStyle: const TextStyle(color: Colors.white38),
                  icon: const Icon(
                    Icons.width_normal,
                    color: Colors.yellow,
                  ),
                  fillColor: Colors.black,
                  filled: true
                ),
              ),
              SizedBox(
                height: height*0.05,
              ),
              TextButton(
                  onPressed: () {
                    calculate(heightController, weightController);
                  },
                  child: Text(
                    'Тооцоол',
                    style: TextStyle(fontSize: height*0.05, color: Colors.yellow),
                  )),
                  
                  SizedBox(height: height*0.05),
                  Text(wordResult, style: TextStyle(
                    color: accentColor,
                    fontSize: height*0.025
                  ),),
                  LeftBar(BarWidth: width*0.28),
                  SizedBox(height: height*0.05),
                  LeftBar(BarWidth: width*0.15),
                   SizedBox(height: height*0.05),
                  LeftBar(BarWidth: width*0.23),
                  
                  RightBar(),
                   SizedBox(height: height*0.05),
                  RightBar(),
                   SizedBox(height: height*0.05),
                  RightBar()


            ],
          ),
        ),
      ),
    );
  }
}
