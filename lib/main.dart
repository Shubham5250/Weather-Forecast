import 'package:flutter/material.dart';
import '';
import 'Screens/loginScreen.dart';
// package by google

//main fxn
void main() {
  runApp(const MyApp());
}

//State of the applicationn is not changing
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:LoginScreen(),
    );
  }
}




