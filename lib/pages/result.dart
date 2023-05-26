// ignore_for_file: prefer_const_constructors

import 'package:calculate_bmi/pages/services/constances.dart';
import 'package:calculate_bmi/pages/services/create_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myData = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Expanded(
              flex: 1,
              child: Text('  Your Result',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'Quitery-Regular',
                  ))),
          SizedBox(height: 10),
          Expanded(
            flex: 13,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1e203a),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Center(
                    child: Text(myData['result'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.green,
                          fontFamily: 'Quitery-Regular',
                        )),
                  ),
                  Center(child: Text(myData['thebmi'], style: myTextStyletwo)),
                  Center(
                      child: SizedBox(
                          width: 350,
                          child: Text(myData['description'].toString(),
                              style: myTextStyle))),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Bottonbutton('GO BACK'),
            ),
          ),
        ],
      ),
    ));
  }
}
