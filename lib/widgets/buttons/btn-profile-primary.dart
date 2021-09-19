import 'package:flutter/material.dart';

class BtnProfilePrimary extends StatelessWidget {
  final String text;
  final Function onPressed;
  BtnProfilePrimary({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0C68E3),
              Color(0xff2B85FE),
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
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
