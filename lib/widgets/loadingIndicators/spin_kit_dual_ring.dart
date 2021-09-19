import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitDualRing extends StatelessWidget {
  final color;
  SpinkitDualRing({this.color});
  @override
  Widget build(BuildContext context) {
    return SpinKitDualRing(
      color: color ?? Color(0xff0C68E3),
      lineWidth: 3,
      size: 38,
    );
  }
}
