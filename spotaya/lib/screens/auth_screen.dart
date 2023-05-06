// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotaya/widgets/auth_form.dart';

enum AuthType { login, register }

class AuthScreen extends StatelessWidget {
  final AuthType authType;

  const AuthScreen({super.key, required this.authType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 40, 39, 39),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Text(
                          'Hello!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5),
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          height: 300,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AuthForm(authType: authType),
          ],
        ),
      ),
    );
  }
}
