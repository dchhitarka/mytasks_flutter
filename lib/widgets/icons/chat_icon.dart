// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../screens/commonScreens/chatListScreen/chat_list_screen.dart';
// import '../../providers/push_notifications.dart';
//
// class ChatIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final chatNotifications = Provider.of<PushNotifications>(context).chatNotifications;
//     return GestureDetector(
//       onTap: () => Navigator.of(context).pushNamed(ChatListScreen.routeName),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 5, right: 5),
//         child: Stack(
//           children: [
//             Image.asset('assets/icons/message.png', scale: 2),
//             if (chatNotifications.length > 0)
//               Positioned(
//                 right: 0,
//                 top: 4,
//                 child: Container(
//                   width: 9.0,
//                   height: 9.0,
//                   decoration: new BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(.2),
//                         blurRadius: 8.0,
//                       ),
//                     ],
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
