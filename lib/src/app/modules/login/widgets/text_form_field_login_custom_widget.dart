import 'package:flutter/material.dart';
import '../../../common/constants/constants_colors.dart';

class TextFormFieldLoginCustomWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? hintText;
  final Widget? suffixIcon;
  const TextFormFieldLoginCustomWidget({
    Key? key,
    required this.title,
    this.controller,
    this.type,
    this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      cursorColor: colorGreen,
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconColor: colorGreen,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colorGreen,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colorGreen,
          ),
        ),
      ),
    );
  }
}
