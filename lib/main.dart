import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart'; // Import the expressions package
import 'ButtonPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = "0";
  String result = "0";
  String expression = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
        expression = "";
      } else if (buttonText == "=") {
        try {
          expression = expression.replaceAll('X', '*');
          print('Evaluating expression: $expression');
          Expression exp = Expression.parse(expression);
          final evaluator = const ExpressionEvaluator();
          Map<String, dynamic> context = {}; // Ensures correct type
          num evalResult = evaluator.eval(exp, context);

          print('Evaluation result: $evalResult');

          result = evalResult.toString();
        } catch (e) {
          print('Error evaluating expression: $e');
          result = "Error";
        }
        equation = expression;
        expression = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "X" ||
          buttonText == "/") {
        if (expression.isEmpty && result != "0") {
          expression = result;
        }
        expression += buttonText;
        equation += buttonText;
      } else {
        if (equation == "0" || equation == "Error") {
          equation = buttonText;
        } else {
          equation += buttonText;
        }
        expression += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: 38),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: 48),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttonpage(
                  buttonText: 'AC',
                  buttonColor: Colors.grey.shade300,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '+/-',
                  buttonColor: Colors.grey.shade300,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '%',
                  buttonColor: Colors.grey.shade300,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '/',
                  buttonColor: Colors.amber.shade700,
                  onPressed: buttonPressed,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttonpage(
                  buttonText: '7',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '8',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '9',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: 'X',
                  buttonColor: Colors.amber.shade700,
                  onPressed: buttonPressed,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttonpage(
                  buttonText: '4',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '5',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '6',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '-',
                  buttonColor: Colors.amber.shade700,
                  onPressed: buttonPressed,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttonpage(
                  buttonText: '1',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '2',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '3',
                  buttonColor: Colors.grey.shade800,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '+',
                  buttonColor: Colors.amber.shade700,
                  onPressed: buttonPressed,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    buttonPressed('0');
                  },
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35.0),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(34, 20, 128, 20),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(69.0),
                      ),
                    ),
                  ),
                ),
                Buttonpage(
                  buttonText: '.',
                  buttonColor: Colors.grey.shade700,
                  onPressed: buttonPressed,
                ),
                Buttonpage(
                  buttonText: '=',
                  buttonColor: Colors.amber.shade700,
                  onPressed: buttonPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
