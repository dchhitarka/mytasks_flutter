import 'package:flutter/material.dart';

class NotFoundError extends StatelessWidget {
  final text;
  NotFoundError(this.text);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (ctx, _) {
      final orientation = MediaQuery.of(context).orientation;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (orientation == Orientation.portrait)
              Image.asset(
                'assets/images/assign.png',
                scale: 2,
                height: 180,
              ),
            Text(
              text,
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 16,
              ),
            )
          ],
        ),
      );
    });
  }
}
