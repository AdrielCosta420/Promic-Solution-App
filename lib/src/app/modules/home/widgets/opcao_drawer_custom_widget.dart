import 'package:flutter/material.dart';

class OpcaoDrawerCustomWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const OpcaoDrawerCustomWidget({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children:  [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          
        ],
      ),
    );
  }
}
