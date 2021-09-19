import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Widget loadingWidget;
  final bool isLoading;

  BtnPrimary({this.text, this.onPressed, this.loadingWidget, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? loadingWidget
          : Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 10)),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor),
      ),
    );
  }
}
