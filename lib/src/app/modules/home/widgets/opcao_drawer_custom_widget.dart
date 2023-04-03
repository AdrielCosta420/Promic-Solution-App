import 'package:flutter/material.dart';

class OpcaoDrawerCustomWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const OpcaoDrawerCustomWidget(
      {Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 23),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 30,
          color: Color.fromARGB(255, 214, 243, 229),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
