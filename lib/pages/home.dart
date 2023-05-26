// ignore_for_file: prefer_const_constructors
import 'package:calculate_bmi/pages/services/create_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculate_bmi/pages/services/constances.dart';
import 'package:calculate_bmi/pages/services/calculator_brain.dart';

enum Gender {
  male,
  female,
  notSelected
} // create an enum for cards instead of numbers.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color femaleCardColour = inActiveColour;
  Color maleCardColour = inActiveColour;

  late Gender selectedCard = Gender.notSelected; // check which card is selected

  int height = 170;
  int weight = 70;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator', style: myTextStyle),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Gender.male;
                        });
                      },
                      child: CreateCard(
                          selectedCard == Gender.male
                              ? activeColour
                              : inActiveColour,
                          CreateIcon(
                              Icon(FontAwesomeIcons.mars,
                                  color: Color(0xffD3D3D3), size: 80),
                              'Male')),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Gender.female;
                        });
                      },
                      child: CreateCard(
                          selectedCard == Gender.female
                              ? activeColour
                              : inActiveColour,
                          CreateIcon(
                              Icon(FontAwesomeIcons.venus,
                                  color: Color(0xffD3D3D3), size: 80),
                              'Female')),
                    )),
                  ],
                )),
            Expanded(
                flex: 10,
                child: CreateCard(
                    Color(0XFF111328),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: myTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(height.toString(), style: myTextStyletwo),
                            SizedBox(width: 10),
                            Text('CM', style: myTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 26,
                              )),
                          child: Slider(
                            onChanged: (newHeight) {
                              setState(() {
                                height = newHeight.toInt();
                              });
                            },
                            activeColor: const Color(0XFFEB1555),
                            inactiveColor: Colors.grey,
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                          ),
                        ),
                      ],
                    ))),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: CreateCard(
                          Color(0XFF111328),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: myTextStyle),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(weight.toString(),
                                      style: myTextStyletwo),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CreateButton(
                                      myIcon: FontAwesomeIcons.minus,
                                      myFunction: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                  SizedBox(width: 20),
                                  CreateButton(
                                      myIcon: FontAwesomeIcons.plus,
                                      myFunction: () {
                                        setState(() {
                                          weight++;
                                        });
                                      })
                                ],
                              )
                            ],
                          )),
                    ),
                    Expanded(
                        child: CreateCard(
                            Color(0XFF111328),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('AGE', style: myTextStyle),
                                Text(age.toString(), style: myTextStyletwo),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CreateButton(
                                        myIcon: FontAwesomeIcons.minus,
                                        myFunction: (() {
                                          setState(() {
                                            age--;
                                          });
                                        })),
                                    SizedBox(width: 20),
                                    CreateButton(
                                        myIcon: FontAwesomeIcons.plus,
                                        myFunction: () {
                                          setState(() {
                                            age++;
                                          });
                                        })
                                  ],
                                )
                              ],
                            ))),
                  ],
                )),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain rslt =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.pushNamed(context, '/result', arguments: {
                    'thebmi': rslt.calculateBMI(),
                    'result': rslt.getResult(),
                    'description': rslt.getDescription(),
                  });
                },
                child: Bottonbutton('CALCULATE'),
              ),
            )
          ],
        ));
  }
}
