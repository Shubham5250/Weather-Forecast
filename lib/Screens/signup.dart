import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart' as Constants;
import '../Components/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'mainScreen.dart';
import '../Network/Location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String email;
  late String phone;
  late String password;
  late String confpassword;

  int myvar = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }
  void apiCall() async{
    var location = await determinePosition();

    myvar = await Constants.apiInstance.getLocation(
        location.latitude.toString(), location.longitude.toString());
    print(location.latitude.toString());

  }

  @override

  Widget build(BuildContext context){

    return Scaffold(

    );
    //






  }

}

