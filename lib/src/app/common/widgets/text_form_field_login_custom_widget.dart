// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants_colors.dart';

class TextFormFieldLoginCustomWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureTex;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  TextFormFieldLoginCustomWidget({
    Key? key,
    required this.title,
    this.controller,
    this.type,
    this.hintText,
    this.suffixIcon,
    this.obscureTex = false,
    this.inputFormatters,
     this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: type,
        cursorColor: colorGreen,
        obscureText: obscureTex,
        inputFormatters: inputFormatters,
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
      ),
    );
  }
}
