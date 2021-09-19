import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitFadeCircle extends StatelessWidget {
  final color;
  final size;
  SpinkitFadeCircle({this.color, this.size = 44.0});
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color == null ? Color(0xff0C68E3) : color,
      size: size,
    );
  }
}
