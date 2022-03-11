import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int? firstNum;
  // int? secondNum;
  // String textToDisplay = '';
  // String? result;
  // String? operatorToPerform;
  // String? history;

  String equation = "0";
  String result = "0";
  String expression = "";

  onTapped(String valv) {
    setState(() {
      if (valv == 'C') {
        equation = '';
        result = '0';
        expression = '';
      }
      // else if (valv == '+' || valv == '-' || valv == 'x' || valv == '/') {
      //   firstNum = int.parse(textToDisplay);

      //   result = '';
      //operatorToPerform = valv;
      //history = firstNum.toStr
      //}
      else if (valv == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        // secondNum = int.parse(textToDisplay);
        // if (operatorToPerform == '+') {
        //   //textToDisplay = valv;
        //   textToDisplay = firstNum.toString() +
        //       operatorToPerform.toString() +
        //       secondNum.toString();
        //   result = (firstNum! + secondNum!).toString();
        // }
        // if (operatorToPerform == '-') {
        //   result = (firstNum! - secondNum!).toString();
        // }
        // if (operatorToPerform == 'x') {
        //   result = (firstNum! * secondNum!).toString();
        // }
        // if (operatorToPerform == '/') {
        //   result = (firstNum! / secondNum!).toString();
        // }
      } else if (valv == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else {
        //result = int.parse(equation + valv).toString();
        if (equation == "0") {
          equation = valv;
        } else {
          equation = equation + valv.toString();
        }
      }
    });
    // setState(() {
    //   equation = result;
    // });
  }

  Widget myButtons(String value) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25),
      onPressed: () => onTapped(value),
      child: Text(
        value,
        style: TextStyle(fontSize: 25),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caclu Lator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 80,
              //color: Colors.blue,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                equation,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              height: 80,
              //color: Colors.amber,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                result,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                myButtons('C'),
                myButtons('⌫'),
                myButtons('/'),
                myButtons('x')
              ],
            ),
            Row(
              children: [
                myButtons('7'),
                myButtons('8'),
                myButtons('9'),
                myButtons('-')
              ],
            ),
            Row(
              children: [
                myButtons('4'),
                myButtons('5'),
                myButtons('6'),
                myButtons('+')
              ],
            ),
            Row(
              children: [
                myButtons('1'),
                myButtons('2'),
                myButtons('3'),
                myButtons('')
              ],
            ),
            Row(
              children: [
                myButtons('.'),
                myButtons('0'),
                myButtons('00'),
                myButtons('=')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
