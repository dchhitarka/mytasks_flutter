// import 'package:flutter/material.dart';
//
// import '../cards/link_tile.dart';
//
// class LinkDialog extends StatelessWidget {
//   final links;
//   LinkDialog(this.links);
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Links',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 22,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close, size: 35, color: Color(0xff707070)),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                 ],
//               ),
//               if (links.isEmpty)
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 30),
//                     child: Text('No links'),
//                   ),
//                 ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: links.length,
//                 itemBuilder: (ctx, i) => LinkTile(
//                   link: links[i],
//                 ),
//               ),
//               SizedBox(height: 15),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
