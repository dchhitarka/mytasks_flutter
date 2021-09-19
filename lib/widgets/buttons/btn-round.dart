import 'package:flutter/material.dart';

class BtnRound extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  BtnRound({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Theme.of(context).accentColor, // button color
        child: InkWell(
          splashColor: Theme.of(context).primaryColor, // inkwell color
          child: SizedBox(
            width: 36,
            height: 36,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
