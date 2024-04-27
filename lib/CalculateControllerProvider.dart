import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateControllerProvider extends ChangeNotifier {
  String userInput = "";
  String userOutput = "";

  void equalPressed() {
    String userInputFC = userInput;
    userInputFC = userInputFC.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = eval.toString();
    notifyListeners();
  }

  void clearInputAndOutput() {
    userInput = "";
    userOutput = "";
    notifyListeners();
  }

  void deleteBtnAction() {
    userInput = userInput.substring(0, userInput.length - 1);
    notifyListeners();
  }

  void onBtnTapped(List<String> buttons, int index) {
    userInput += buttons[index];
    notifyListeners();
  }
}
