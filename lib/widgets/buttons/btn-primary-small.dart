import 'package:flutter/material.dart';

class BtnPrimarySmall extends StatelessWidget {
  final String text;
  final Function onPressed;

  BtnPrimarySmall({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 15)),
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 9)),
        backgroundColor: MaterialStateProperty.all(Color(0xff007BFF)),
      ),
    );
  }
}
