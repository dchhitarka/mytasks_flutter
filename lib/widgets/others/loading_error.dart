import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {
  final Function onRetry;
  LoadingError({this.onRetry});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/error.png',
          scale: 3,
        ),
        SizedBox(height: 5),
        Text(
          'Can\'t Connect',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: onRetry,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.replay_outlined,
                size: 18,
                color: Colors.grey,
              ),
              Text(
                'Tap to Retry',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
