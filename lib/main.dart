// ignore_for_file: prefer_const_constructors

import 'package:calculate_bmi/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:calculate_bmi/pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xff0A0E21)),
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/result': (context) => ResultPage(),
      },
    ),
  );
}
