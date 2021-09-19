import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String initialValue;
  final String label;
  final String hint;
  final bool isPassword;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final int maxLines;
  final bool enabled;
  final bool isShrink;
  final hintSize;
  final icon;
  final onIconPressed;
  final onFieldSubmitted;

  Input({
    this.enabled,
    this.onChanged,
    this.initialValue,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.controller,
    this.maxLines = 1,
    this.hint,
    this.label,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.isShrink = false,
    this.hintSize = 18.0,
    this.icon,
    this.onIconPressed,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(color: Color(0xff001A3D), fontSize: hintSize),
        ),
        if (!isShrink) SizedBox(height: 10),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          initialValue: initialValue,
          keyboardType: inputType,
          maxLines: maxLines,
          enabled: enabled,
          decoration: InputDecoration(
            suffixIcon: onIconPressed == null
                ? null
                : GestureDetector(
                    onTap: () => onIconPressed(controller.text.trim()),
                    child: Icon(icon),
                  ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          textInputAction: inputAction,
          onFieldSubmitted: onFieldSubmitted == null
              ? (_) => FocusScope.of(context).requestFocus(focusNode)
              : onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
