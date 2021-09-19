// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../providers/connections.dart';
// import '../../providers/auth.dart';
// import '../../helpers/snackbar_helper.dart';
// import '../../models/user.dart';
// import '../../widgets/loadingIndicators/spin_kit_fade_circle.dart';
//
// class BtnConnect extends StatefulWidget {
//   final User designer;
//   final text;
//   BtnConnect({this.designer, this.text});
//
//   @override
//   _BtnConnectState createState() => _BtnConnectState();
// }
//
// class _BtnConnectState extends State<BtnConnect> {
//   bool _isLoading = false;
//   bool _isConnected = false;
//   String _text;
//
//   @override
//   void initState() {
//     _text = widget.text;
//     super.initState();
//   }
//
//   void _requestConnection() {
//     if (_text == 'Connected' || _text == 'Requested') return;
//     setState(() {
//       _isLoading = true;
//       _text = 'Connecting';
//     });
//     final user = Provider.of<Auth>(context, listen: false).user;
//     Provider.of<Connections>(context, listen: false)
//         .requestConnection(
//       widget.designer.userId,
//       'Helo this is ${widget.designer.username} here is my connection request',
//       user.username,
//     )
//         .then((_) {
//       setState(() {
//         _isLoading = false;
//         _isConnected = null;
//         _text = 'Requested';
//       });
//     }).catchError((err) {
//       SnackBarHelper.showErrorSnackBar(
//           context, err.message ?? 'Request failed, check your connection');
//       setState(() {
//         _isLoading = false;
//         _isConnected = false;
//         _text = 'Connect';
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _requestConnection,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xff0C68E3),
//               Color(0xff2B85FE),
//             ],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.2),
//               blurRadius: 8,
//               spreadRadius: 1,
//               offset: Offset(0, 2),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             Text(
//               _text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//               ),
//             ),
//             if (_isConnected != null && !_isConnected) SizedBox(width: 5),
//             if (_isConnected != null && !_isConnected && _text != 'Requested' && !_isLoading)
//               Image.asset('assets/icons/connections.png', scale: 2.8),
//             if (_isLoading) SpinkitFadeCircle(color: Colors.white, size: 15.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
