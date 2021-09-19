// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../screens/commonScreens/editProfileScreen/edit_profile_screen.dart';
// import '../../providers/auth.dart';
//
// class BtnProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var user = Provider.of<Auth>(context).user;
//     final name =
//         '${user.username.split(' ')[0][0].toUpperCase()}${user.username.split(' ').length > 1 ? user.username.split(' ')[1][0].toUpperCase() : ''}';
//     return GestureDetector(
//       onTap: () => Navigator.of(context).pushNamed(EditProfileScreen.routeName),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).accentColor,
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.white, width: 2),
//         ),
//         child: Center(
//           child: Text(
//             name,
//             style: TextStyle(
//               fontSize: name.length == 1 ? 16 : 14,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
