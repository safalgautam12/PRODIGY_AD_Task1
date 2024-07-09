import 'package:flutter/material.dart';

class Buttonpage extends StatelessWidget {
  Buttonpage({
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  });

  final String buttonText;
  final Color buttonColor;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(buttonText);
        onPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 35.0),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
        shape: MaterialStateProperty.all(CircleBorder()),
      ),
    );
  }
}
