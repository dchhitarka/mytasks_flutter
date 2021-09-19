import 'package:flutter/material.dart';

class BtnIconOutlined extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;

  BtnIconOutlined({this.text, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(text),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}
