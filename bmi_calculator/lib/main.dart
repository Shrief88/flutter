import 'package:bmi_calculator/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'screens/input_file.dart';
import 'screens/results_page.dart';
// ignore_for_file: prefer_const_constructors

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0D22),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: InputPage(),
    );
  }
}
