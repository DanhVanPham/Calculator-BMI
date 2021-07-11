import 'dart:math';
import 'package:bmi_calculator/constants.dart';

class CalculatorBrain {
  late final int height;
  late final int weight;
  late double _bmi;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  StatusBMI getResultText() {
    if (_bmi > 25) {
      return StatusBMI.overweight;
    } else if (_bmi > 18.5) {
      return StatusBMI.normal;
    } else {
      return StatusBMI.under;
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
