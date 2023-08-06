import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',

      home: const BmiCalculator(),
    );
  }
}

enum Gender{
  male,female
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double height = 180;
  double weight = 30;
  int age = 28;
  Gender? genderSelected;

  Widget buildGenderContainer(String gender,IconData icon,Function tap) {
    return GestureDetector(
      onTap: ()=> tap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: genderSelected == Gender.male? Colors.amber:Colors.blue),
        child: Column(
          children: [
            Icon(icon,
              size: 120,
              color: const Color(0xffEB1555),
            ),
            Text(gender,
              style: const TextStyle(color:Color(0xffEB1555)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090E21),
      appBar: AppBar(
        backgroundColor: const Color(0xff090E21),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Row(
                children: [
                  buildGenderContainer('Female', Icons.female,(){setState(() {
                    genderSelected = Gender.female;
                  });}),
                  const SizedBox(
                    width: 20,
                  ),
                  buildGenderContainer('Male', Icons.male,(){
                    genderSelected = Gender.male;
                  })
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff1D1E33)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(color: Colors.white),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: '${height.floor()}',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'cm')
                      ]),
                    ),
                    Slider(
                        value: height,
                        min: 0,
                        max: 360,
                        activeColor: const Color(0xffF5C1D1),
                        inactiveColor: const Color(0xff555555),
                        divisions: 200,
                        label: height.round().toString(),
                        thumbColor: const Color(0xffEB1555),
                        onChanged: (double value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff1D1E33)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Weight',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('${weight.round()}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 35)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4C4F5E)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 35,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff6E6F7A)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (weight < 120) {
                                      weight++;
                                    } else {}
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Color(0xffF67FA4),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff1D1E33)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Age',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('$age',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 35)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4C4F5E)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 35,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff6E6F7A)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (age < 120) {
                                      age++;
                                    } else {}
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Color(0xffF67FA4),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color(0xffEB1555)),
            child: const Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
