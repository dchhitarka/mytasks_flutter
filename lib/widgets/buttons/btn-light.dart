import 'package:flutter/material.dart';

import '../loadingIndicators/spin_kit_fade_circle.dart';

class BtnLight extends StatelessWidget {
  final Function onPressed;
  final String text;
  final String iconPath;
  final double horizontalPadding;
  final double verticalPadding;
  final double textSize;
  final double scale;
  final bool isLoading;
  BtnLight({
    this.onPressed,
    this.text,
    this.horizontalPadding = 15.0,
    this.verticalPadding = 8.0,
    this.iconPath,
    this.scale = 2.2,
    this.textSize = 14,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFFFF),
              Color(0xffF2F7FF),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(0xff1975EF),
                fontWeight: FontWeight.w600,
                fontSize: textSize,
              ),
            ),
            if (iconPath != null || isLoading) SizedBox(width: 5),
            if (iconPath != null && !isLoading) Image.asset(iconPath, scale: scale),
            if (isLoading) SpinkitFadeCircle(size: 15.0),
          ],
        ),
      ),
    );
  }
}
