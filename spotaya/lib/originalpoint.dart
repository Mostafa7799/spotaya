// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  //const OriginalButton({super.key});
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color bgColor;

  const OriginalButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.textColor,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          primary: Colors.black,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
