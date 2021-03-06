import 'package:cinema/components/text_field.dart';
import 'package:cinema/constants/color.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: AccentColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AccentColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: TextColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
