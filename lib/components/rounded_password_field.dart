import 'package:cinema/components/text_field.dart';
import 'package:cinema/constants/color.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key key,
    this.hintText = "Password",
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: AccentColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: AccentColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: AccentColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
