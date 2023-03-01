
import 'package:flutter/material.dart';
import '../constants.dart' as Constants;
import '../Components/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'mainScreen.dart';
import '../Network/Location.dart';
import '../Network/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String email, password;
  int myvar=1;

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
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Constants.textPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container()),
          Expanded(
              child: textField(text: 'Email', isPassword: false,onchanged: (value){email = value;}),),
          Expanded(
            child: textField(text: 'Password', isPassword: true, onchanged: (value){password = value;}),),
          ClipRRect(
            borderRadius: BorderRadius.circular(28.8),

            child: Container(
              width: 180,
              height: 70  ,
              color: Constants.dayPrimary,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.8),
                        side: BorderSide(
                          width: 2.9,
                          color: Colors.orange,
                        )
                    )
                ),
                onPressed: () async {

                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("isLoggedIn",true);
                  try{
                    final newUser =
                    await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (newUser.user != null && myvar !=0) {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context)  => MainScreen(
                      )));
                    }

                  }
                  catch(e){

                    print(e);
                  }

                }, child: Text('Login',
                style: TextStyle(
                  fontSize: 44.9,
                  color: Constants.textPrimary,
                ),
              ),
              ),
            ),
          ),
          Expanded(child: Container())


        ],


      ),
    );
  }
}

