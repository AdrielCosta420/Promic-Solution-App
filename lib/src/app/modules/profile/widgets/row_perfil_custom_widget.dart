// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowPerfilCustomWidget extends StatelessWidget {
  RowPerfilCustomWidget({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  String titulo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(titulo),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
      ],
    );
  }
}
