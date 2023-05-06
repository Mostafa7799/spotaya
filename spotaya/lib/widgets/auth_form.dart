// ignore_for_file: prefer_const_constructors, duplicate_ignore, curly_braces_in_flow_control_structures, use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spotaya/originalpoint.dart';
import 'package:spotaya/screens/auth_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotaya/screens/homeScreen.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key? key, required this.authType}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  // AuthBase authBase = AuthBase();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(height: 40),
            TextFormField(
              onChanged: (value) => _email = value,
              validator: (value) =>
                  value!.isEmpty ? 'Enter a valid email' : null,
              decoration: InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'ex : test@gmail.com'),
            ),
            SizedBox(height: 12),
            TextFormField(
              onChanged: (value) => _password = value,
              validator: (value) => value!.length < 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
              decoration: InputDecoration(
                labelText: 'Enter your password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            OriginalButton(
                text: widget.authType == AuthType.login ? 'Login' : 'Register',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.authType == AuthType.login) {
                      // await authBase.loginWithEmailAndPassword(
                      //  _email,
                      //_password,
                      // );
                    } else {
                      //await authBase.registerWithEmailAndPassword(
                      //  _email, _password);
                      await firestore.collection('users').doc(_email).set({
                        'email': _email,
                        'password': _password,
                      });
                    }
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                textColor: Colors.black,
                bgColor: Colors.white),
            SizedBox(
              height: 5,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                onSurface: Colors.black,
              ),
              onPressed: () {
                if (widget.authType == AuthType.login)
                  Navigator.of(context).pushReplacementNamed('register');
                else
                  Navigator.of(context).pushReplacementNamed('login');
              },
              child: Text(
                widget.authType == AuthType.login
                    ? "Don't have an account?"
                    : "You have an account?",
              ),
            )
          ],
        ),
      ),
    );
  }
}
