// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotaya/originalpoint.dart';

class introScreen extends StatelessWidget {
  const introScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 39, 39),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Image.asset(
                  'assets/images/logo.png',
                ),
                OriginalButton(
                  text: 'Get Started',
                  onPressed: () => Navigator.of(context).pushNamed('login'),
                  textColor: Colors.white,
                  bgColor: Color.fromARGB(255, 40, 39, 39),
                )
              ]),
        ),
      ),
    );
  }
}
