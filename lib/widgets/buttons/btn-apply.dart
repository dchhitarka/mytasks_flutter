import 'package:flutter/material.dart';

import '../loadingIndicators/spin_kit_fade_circle.dart';

class BtnApply extends StatelessWidget {
  final onPressed;
  final text;
  final isLoading;
  BtnApply({this.onPressed, this.text, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: Colors.white)),
          if (isLoading) SizedBox(width: 5),
          if (isLoading)
            SpinkitFadeCircle(
              color: Colors.white,
              size: 16.0,
            )
        ],
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(4), //Defines Elevation
        shadowColor: MaterialStateProperty.all(Theme.of(context).accentColor.withOpacity(.8)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor),
      ),
    );
  }
}
