import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  late double bmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              // ignore: prefer_const_constructors
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(170, 245, 96, 33),
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.male, size: 150),
                            Text("Male"),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(170, 245, 96, 33),
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.female, size: 150),
                            const Text("Female"),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Height",
                                style: TextStyle(
                                    color: Color(0xffff9000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$height",
                              style: kinputLabelColor,
                            ),
                            Row(children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height >= 50) height--;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    });
                                  },
                                  child: Icon(Icons.remove, size: 40)),
                              const SizedBox(width: 20),
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height <= 200) height++;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    });
                                  },
                                  child: Icon(Icons.add, size: 40)),
                            ])
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Weight",
                                style: TextStyle(
                                    color: Color(0xffff9000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$weight",
                              style: kinputLabelColor,
                            ),
                            Row(children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight >= 10) weight--;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    });
                                  },
                                  child: Icon(Icons.remove, size: 40)),
                              SizedBox(width: 20),
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight <= 300) weight++;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    });
                                  },
                                  child: Icon(Icons.add, size: 40)),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      const Text("BMI"),
                      Text("${bmi.toStringAsFixed(2)}",
                          style: kinputLabelColor),
                      Text(
                        getResult(bmi),
                        style: TextStyle(
                            color: Color.fromARGB(170, 13, 235, 80),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ))),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'OverWeight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
}
