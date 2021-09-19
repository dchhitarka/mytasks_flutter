import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitLoading extends StatelessWidget {
  final size;
  SpinKitLoading({this.size = 18.0});
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: Colors.white,
      size: size,
    );
  }
}
