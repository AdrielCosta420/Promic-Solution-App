import 'package:flutter/material.dart';

class TextFormFieldCustomWidget extends StatelessWidget {
  final String title;
  final String hintDescription;
  const TextFormFieldCustomWidget(
      {Key? key, required this.title, required this.hintDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(color: Colors.white38),
        ),
        hintText: hintDescription,
        hintStyle: TextStyle(color: Colors.white24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.white,
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
            color: Colors.white24,
          ),
        ),
      ),
    );
  }
}
