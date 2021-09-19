import 'package:flutter/material.dart';

class BtnDropDown extends StatelessWidget {
  final value;
  final label;
  final List<dynamic> options;
  final onChange;
  final isAuth;
  BtnDropDown({this.value, this.label, this.onChange, this.options, this.isAuth = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isAuth ? Colors.white : Color(0xff001A3D),
            fontWeight: isAuth ? FontWeight.w500 : FontWeight.normal,
            fontSize: isAuth ? 14 : 18,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: onChange == null ? Colors.grey.withOpacity(.6) : Color(0xff263238)),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: DropdownButton(
              isExpanded: true,
              isDense: true,
              value: value,
              onChanged: onChange,
              items: options
                  .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(color: Color(0xff263238).withOpacity(.7)),
                      )))
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
