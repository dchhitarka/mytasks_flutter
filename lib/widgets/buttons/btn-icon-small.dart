import 'package:flutter/material.dart';

import '../loadingIndicators/spin_kit_fade_circle.dart';

class BtnIconSmall extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Widget icon;
  final isLoading;
  BtnIconSmall({this.icon, this.onPressed, this.text, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isLoading) SizedBox(width: 5),
            if (isLoading)
              SpinkitFadeCircle(
                color: Colors.white,
                size: 20.0,
              ),
          ],
        ),
      ),
    );
  }
}
