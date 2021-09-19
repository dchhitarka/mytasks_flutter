// import 'package:flutter/material.dart';
//
// import '../others/rating_stars.dart';
// import '../buttons/btn-primary-small.dart';
// import '../../models/user.dart';
//
// class RatingDialog extends StatefulWidget {
//   final List<User> members;
//   RatingDialog(this.members);
//
//   @override
//   _RatingDialogState createState() => _RatingDialogState();
// }
//
// class _RatingDialogState extends State<RatingDialog> {
//   List<Map<String, dynamic>> _members;
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _members = widget.members.map((item) {
//       return {
//         'userId': item.userId,
//         'username': item.username,
//         'location': item.location,
//         'rating': 1.0,
//       };
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(left: 10, right: 10, top: 14),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: GestureDetector(
//                   child: Icon(Icons.close, size: 35, color: Color(0xff707070)),
//                   onTap: () => Navigator.of(context).pop(),
//                 ),
//               ),
//               Text(
//                 'Rate His/Her Performance',
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Opacity(
//                     opacity: _currentIndex > 0 ? 1 : 0,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back_ios_outlined),
//                       onPressed: () {
//                         if (_currentIndex <= 0) return;
//                         setState(() => _currentIndex--);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Text(
//                           '“${_members[_currentIndex]['username']}”',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           _members[_currentIndex]['location'],
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Color(0xff5787CA),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Opacity(
//                     opacity: _currentIndex < _members.length - 1 ? 1 : 0,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_forward_ios_outlined),
//                       onPressed: () {
//                         if (_currentIndex >= _members.length - 1) return;
//                         setState(() {
//                           _currentIndex++;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               RatingStars(
//                 initialRating: _members[_currentIndex]['rating'],
//                 isDisabled: false,
//                 size: 35,
//                 color: Theme.of(context).accentColor,
//                 onChange: (val) {
//                   setState(() {
//                     _members[_currentIndex]['rating'] = val;
//                   });
//                 },
//               ),
//               SizedBox(height: 5),
//               if (_currentIndex == _members.length - 1)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     BtnPrimarySmall(
//                       text: 'Close Work',
//                       onPressed: () => Navigator.of(context).pop(_members),
//                     ),
//                   ],
//                 ),
//               SizedBox(height: 5),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
