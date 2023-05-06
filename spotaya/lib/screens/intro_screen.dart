// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotaya/originalpoint.dart';

class introScreen extends StatelessWidget {
  const introScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 39, 39),
      body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 500,
            ),
            OriginalButton(
              text: 'Get Started',
              onPressed: () => Navigator.of(context).pushNamed('login'),
              textColor: Colors.white,
              bgColor: Color.fromARGB(255, 40, 39, 39),
            )
          ]),
    );
  }
}
