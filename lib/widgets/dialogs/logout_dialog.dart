// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../providers/auth.dart';
// import '../../screens/commonScreens/loginScreen/login_screen.dart';
// import '../../helpers/snackbar_helper.dart';
// import '../../widgets/loadingIndicators/spin_kit_loading.dart';
//
// class LogoutDialog extends StatefulWidget {
//   @override
//   _LogoutDialogState createState() => _LogoutDialogState();
// }
//
// class _LogoutDialogState extends State<LogoutDialog> {
//   bool _isLoading = false;
//   void _logout() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       final user = Provider.of<Auth>(context, listen: false).user;
//       await FirebaseMessaging.instance.unsubscribeFromTopic(user.userId);
//       await Provider.of<Auth>(context, listen: false).logout();
//       Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
//     } catch (err) {
//       SnackBarHelper.showErrorSnackBar(context, 'Logout failed, check your connection');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                   icon: Icon(Icons.close, size: 35, color: Color(0xff707070)),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Are you sure?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'By clicking Yes you will be logged out',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _button(
//                             text: 'Close',
//                             color: Color(0xffC4C4C4),
//                             onPressed: () => Navigator.of(context).pop(),
//                           ),
//                         ),
//                         SizedBox(width: 15),
//                         Expanded(
//                           child: _button(
//                             text: 'Yes',
//                             color: Theme.of(context).primaryColor,
//                             onPressed: _logout,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 15),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _button({Function onPressed, Color color, String text}) => GestureDetector(
//         onTap: onPressed,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           child: Center(
//             child: _isLoading && text == 'Yes'
//                 ? SpinKitLoading(size: 16.0)
//                 : Text(
//                     text,
//                     style: TextStyle(color: Colors.white),
//                   ),
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: color,
//           ),
//         ),
//       );
// }
