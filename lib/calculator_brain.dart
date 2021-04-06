import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 40) {
      return 'Obesity Class 3';
    } else if (_bmi >= 35) {
      return 'Obesity Class 2';
    } else if (_bmi >= 30) {
      return 'Obesity Class 1';
    } else if (_bmi >= 25) {
      return 'Pre-Obesity';
    } else if (_bmi >= 18.5) {
      return 'Normal Weight';
    } else {
      return 'Underweight';
    }
  }

  String getAdvice() {
    if (_bmi >= 40) {
      return 'Your BMI result is critical, you must decrease calorie intake!';
    } else if (_bmi >= 35) {
      return 'Your BMI result is too high, you must decrease calorie intake!';
    } else if (_bmi >= 30) {
      return 'Your BMI result is high, you should decrease calorie intake!';
    } else if (_bmi >= 25) {
      return 'Your BMI result is quite high, you should decrease calorie intake!';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good Job :)';
    } else {
      return 'Your BMI result is quite low, you should increase calorie intake!';
    }
  }
}
