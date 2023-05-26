import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double bmi = 20;

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    String result = bmi.toString().substring(0, 4);

    return result;
  }

  String getResult() {
    int last = int.parse(calculateBMI().substring(0, 2));

    if (last >= 25) {
      return 'OverWeight';
    } else if (last < 18.5) {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String getDescription() {
    String one = calculateBMI().substring(0, 2);
    int last = int.parse(one);
    if (last >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (last < 18.5) {
      return 'You have a lower than normal bodyweight. try eating a bit more.';
    } else {
      return 'You have a normal bodyweight. Good job.';
    }
  }
}
