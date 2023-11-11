import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorNotifier extends ChangeNotifier {
  String question = '0';
  String answer = '0';

  String get questionHandler => question;
  String get answerHandler => answer;

  set questionHandler(String ques) {
    question = ques;
    notifyListeners();
  }

  set answerHandler(String answ) {
    answer = answ;
    notifyListeners();
  }

  equalPressed(String ques) {
    String finalQuestion = ques;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser parser = Parser();
    Expression expression = parser.parse(finalQuestion);

    ContextModel contextModel = ContextModel();
    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);

    answer = evaluate.toString();
    questionHandler = '0';
    notifyListeners();
  }

  final List<String> buttonList = [
    'C',
    'Del',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '--',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '',
    '=',
  ];
}
