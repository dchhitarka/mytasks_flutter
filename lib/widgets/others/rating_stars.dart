// import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class RatingStars extends StatelessWidget {
//   final initialRating;
//   final isDisabled;
//   final size;
//   final onChange;
//   final color;
//   RatingStars({
//     this.initialRating,
//     this.isDisabled = true,
//     this.size = 18,
//     this.onChange,
//     this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar(
//       minRating: 1.0,
//       initialRating: initialRating + 0.0,
//       direction: Axis.horizontal,
//       itemCount: 5,
//       itemSize: size + 0.0,
//       ignoreGestures: isDisabled,
//       ratingWidget: RatingWidget(
//         full: Icon(Icons.star, color: color ?? Color(0xffFDD835)),
//         empty: Icon(Icons.star_outline_outlined, color: color ?? Color(0xffFDD835)),
//         half: Icon(Icons.star_outline_outlined, color: color ?? Color(0xffFDD835)),
//       ),
//       itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
//       onRatingUpdate: onChange,
//     );
//   }
// }
