import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';
import 'screens/calculator_brain.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        // accentColor: Color(0xff1d1e33),
        scaffoldBackgroundColor: Color(0xff0a0d22),
        // textTheme: TextTheme(body1: TextStyle(color: Colors.white))
      ),
      home: InputPage(),
    );
  }
}
