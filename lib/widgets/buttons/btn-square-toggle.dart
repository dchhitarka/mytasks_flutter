import 'package:flutter/material.dart';

class BtnSquareToggle extends StatelessWidget {
  final bool value;
  final Function onTap;
  BtnSquareToggle({this.value, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: value ? Theme.of(context).accentColor : Color(0xffB3ABBC)),
          color: value ? Theme.of(context).accentColor : Colors.white,
        ),
        child: Icon(
          Icons.done,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
