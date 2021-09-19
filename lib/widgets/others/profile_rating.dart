import 'package:flutter/material.dart';

class ProfileRating extends StatelessWidget {
  final rating;
  ProfileRating(this.rating);

  @override
  Widget build(BuildContext context) {
    return rating > 0 && rating != null
        ? Row(
            children: [
              Text(rating.toString()),
              Icon(
                Icons.star,
                size: 15,
                color: Color(0xffFDD835),
              ),
            ],
          )
        : Text(
            'Not rated yet',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey
            ),
          );
  }
}
