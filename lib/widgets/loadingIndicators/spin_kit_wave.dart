import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitWaveLoading extends StatelessWidget {
  final size;
  final color;
  SpinKitWaveLoading({this.size = 30.0, this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: color,
      size: size,
    );
  }
}
