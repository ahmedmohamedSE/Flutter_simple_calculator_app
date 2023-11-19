import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalcHomeScreen extends StatefulWidget {
  const MyCalcHomeScreen({super.key});

  @override
  State<MyCalcHomeScreen> createState() => _MyCalcHomeScreenState();
}

class _MyCalcHomeScreenState extends State<MyCalcHomeScreen> {
  List<String> calcItems = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '=',
  ];
  String input = '';
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('Simple Calculator',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                input,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                output,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 245, 100, 86)),
              ),
            ),
          ),
          Expanded(
            flex:5,
            child: GridView.builder(
              itemCount: calcItems.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return InkWell(
                  //! Logic Code
                  onTap: () {
                    if (calcItems[index] == 'C') {
                      setState(() {
                        input = '';
                        output = '';
                      });
                    } else if (calcItems[index] == 'Del') {
                      setState(() {
                        input = input.substring(0, input.length - 1);
                      });
                    } else if (calcItems[index] == 'Ans') {
                      setState(() {
                        input = output;
                        output = '';
                      });
                    } else if (calcItems[index] == '%' ||
                        calcItems[index] == '/' ||
                        calcItems[index] == '*' ||
                        calcItems[index] == '+' ||
                        calcItems[index] == '-') {
                      if (input.endsWith("%") ||
                          input.endsWith("*") ||
                          input.endsWith("/") ||
                          input.endsWith("+") ||
                          input.endsWith("-")) {
                        
                      } else {
                        setState(() {
                          input += calcItems[index];
                        });
                      }
                    } else if (calcItems[index] == '=') {
                      Expression exp = Parser().parse(input);
                      double result =
                          exp.evaluate(EvaluationType.REAL, ContextModel());
                      setState(() {
                        output = result.toString();
                      });
      
                      //! output  "="
                    } else {
                      setState(() {
                        input += calcItems[index];
                      });
                    }
                    //logic
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: gridViewItemBgColor(calcItems[index]),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      calcItems[index],
                      style: TextStyle(
                        color: myTextColor(calcItems[index]),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Color gridViewItemBgColor(String x) {
    if (x == 'C') {
      return Colors.black87;
    } else if (x == 'Del') {
      return Color.fromARGB(255, 243, 69, 53);
    } else if (x == '%' ||
        x == '/' ||
        x == '+' ||
        x == '*' ||
        x == '-' ||
        x == '=') {
      return Colors.blue.shade400;
    } else {
      return Color.fromARGB(255, 190, 190, 190);
    }
  }

  Color myTextColor(String x) {
    if (x == 'C' ||
        x == '%' ||
        x == 'Del' ||
        x == '/' ||
        x == '+' ||
        x == '*' ||
        x == '-' ||
        x == '=') {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
