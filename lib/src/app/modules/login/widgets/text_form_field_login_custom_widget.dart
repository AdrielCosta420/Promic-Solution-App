import 'package:flutter/material.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';

class TextFormFieldLoginCustomWidget extends StatelessWidget {
  final String title;
  
  const TextFormFieldLoginCustomWidget(
      {Key? key, required this.title, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
  
      
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
