// import 'package:flutter/material.dart';
// import 'package:multiselect_formfield/multiselect_formfield.dart';
//
// class MultiSelectField extends StatelessWidget {
//   final list;
//   final onSaved;
//   final validator;
//   final label;
//   MultiSelectField({
//     this.list,
//     this.onSaved,
//     this.validator,
//     this.label,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: MultiSelectFormField(
//         title: Text(
//           label,
//           style: TextStyle(color: Color(0xff001A3D), fontSize: 16.0),
//         ),
//         autovalidate: false,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderSide: BorderSide(),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         validator: validator,
//         dataSource: list,
//         textField: 'display',
//         valueField: 'value',
//         okButtonLabel: 'OK',
//         cancelButtonLabel: 'CANCEL',
//         onSaved: (val) {
//           FocusScope.of(context).requestFocus(new FocusNode());
//           onSaved(val);
//         },
//         dialogShapeBorder: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//         ),
//       ),
//     );
//   }
// }
