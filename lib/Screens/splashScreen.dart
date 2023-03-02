import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/mainScreen.dart';
import 'package:untitled/main.dart';


// Created splash screen as a stateless widget because we are not changing a state of any widget
///....whenever we create any button or else we create a stateful widget...



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async{
    await apiCall();
    //replace the splash screen
    Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context)=> MainScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


