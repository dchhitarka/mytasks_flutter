import 'package:flutter/material.dart';
import 'package:my_tasks/constants.dart';

class BtnAuth extends StatelessWidget {
  final String text;
  final Function onPressed;

  BtnAuth({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // side: BorderSide(color: Colors.white.withOpacity(.3), width: 2.2),
          ),
        ),
        elevation: MaterialStateProperty.all(6.0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
        backgroundColor: MaterialStateProperty.all(kButtonColor),
      ),
    );
  }
}
