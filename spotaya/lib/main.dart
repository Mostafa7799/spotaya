// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotaya/screens/Entertainment.dart';
import 'package:spotaya/screens/Fitness.dart';
import 'package:spotaya/screens/Food.dart';
import 'package:spotaya/screens/Menu.dart';
import 'package:spotaya/screens/Profile.dart';
import 'package:spotaya/screens/Shopping.dart';
import 'package:spotaya/screens/Spots.dart';
import 'package:spotaya/screens/auth_screen.dart';
import 'package:spotaya/screens/homeScreen.dart';
import 'package:spotaya/screens/intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotaya/screens/plans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: TextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 218, 211, 211),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 218, 211, 211),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 218, 211, 211),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      home: introScreen(),
      routes: {
        'intro': (context) => introScreen(),
        'home': (context) => HomeScreen(),
        'Menu': (context) => Menu(),
        'login': (context) => AuthScreen(authType: AuthType.login),
        'register': (context) => AuthScreen(authType: AuthType.register),
        'Food': (context) => Food(),
        'Entertainment': (context) => Entertainment(),
        'Shopping': (context) => Shopping(),
        'Spots': (context) => Spots(),
        'Fitness': (context) => Fitness(),
        'Plans': (context) => Plans(),
        'Profile': (context) => Profile(),
      },
    );
  }
}
