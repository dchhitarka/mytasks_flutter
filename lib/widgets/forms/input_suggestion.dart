// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
//
// class InputSuggestion extends StatefulWidget {
//   final List<dynamic> skills;
//   final onAddPressed;
//   final onSelected;
//   final hint;
//   final enabled;
//   final TextEditingController controller;
//   final onSumbmitted;
//   final TextInputAction inputAction;
//   InputSuggestion({
//     this.onAddPressed,
//     this.onSelected,
//     this.skills,
//     this.controller,
//     this.hint,
//     this.enabled = true,
//     this.onSumbmitted,
//     this.inputAction,
//   });
//
//   @override
//   _InputSuggestionState createState() => _InputSuggestionState();
// }
//
// class _InputSuggestionState extends State<InputSuggestion> {
//   List<dynamic> skills;
//
//   @override
//   void initState() {
//     super.initState();
//     skills = widget.skills;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TypeAheadField(
//           noItemsFoundBuilder: (ctx) => SizedBox(),
//           textFieldConfiguration: TextFieldConfiguration(
//             onSubmitted: widget.onSumbmitted,
//             textInputAction: widget.inputAction,
//             enabled: widget.enabled,
//             controller: widget.controller,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//               hintText: widget.hint,
//               suffixIcon: IconButton(
//                 onPressed: () => widget.onAddPressed(widget.controller.text.trim()),
//                 icon: Icon(Icons.add),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//             ),
//           ),
//           suggestionsCallback: (query) async {
//             if (query.length != 0) {
//               var lowercaseQuery = query.toLowerCase();
//               return skills.where((skill) {
//                 return skill.toLowerCase().contains(query.toLowerCase());
//               }).toList(growable: false)
//                 ..sort((a, b) => a
//                     .toLowerCase()
//                     .indexOf(lowercaseQuery)
//                     .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
//             } else {
//               return const [];
//             }
//           },
//           direction: AxisDirection.up,
//           itemBuilder: (context, suggestion) {
//             return ListTile(
//               title: Text(suggestion),
//             );
//           },
//           onSuggestionSelected: (suggestion) => widget.onSelected(suggestion),
//         ),
//       ],
//     );
//   }
// }
