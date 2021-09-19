import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String initialValue;
  final String label;
  final String hint;
  final bool isPassword;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final int maxLines;
  final bool enabled;
  final bool isShrink;
  final Widget icon;
  final TextEditingController controller;
  final onIconPressed;
  final labelColor;

  AuthInput({
    this.enabled,
    this.onChanged,
    this.initialValue,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.hint,
    this.label,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.isShrink = false,
    this.icon,
    this.controller,
    this.onIconPressed,
    this.labelColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(color: labelColor, fontWeight: FontWeight.w500),
        ),
        if (!isShrink) SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          initialValue: initialValue,
          keyboardType: inputType,
          maxLines: maxLines,
          enabled: enabled,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            suffixIcon: icon == null
                ? null
                : GestureDetector(
                    onTap: onIconPressed,
                    child: icon,
                  ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          textInputAction: inputAction,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(focusNode),
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
