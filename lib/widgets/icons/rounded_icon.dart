import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final IconData icon;
  final size;
  final iconSize;
  RoundedIcon(this.icon, [this.iconSize, this.size = 35.0]);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: iconSize ?? IconTheme.of(context).size,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(200),
        ),
        color: Colors.green,
      ),
    );
  }
}
