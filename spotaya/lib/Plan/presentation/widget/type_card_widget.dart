import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isChecked = false,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Function onPressed;
  final bool isChecked;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 116.0,
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Card(
          color: !isChecked ? Colors.black38 : Colors.black,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                   Icon(
                    icon,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
