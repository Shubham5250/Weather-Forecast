import 'package:flutter/material.dart';
import '../Components/textField.dart';
import '../constants.dart' as Constant;
import 'package:firebase_auth/firebase_auth.dart';
import 'mainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LogiunScreenState();
}

class _LogiunScreenState extends State<LoginScreen> {


  late String email, password;
  int myVar = 0;

  @override
  Widget build(BuildContext context) {

    final auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Constant.textPrimary,
      body: Column(
        children: [
          Expanded(child: Container()),
          Image.network(
              'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyT2?ver=7fed'),
          textField(text: "E-mail", isPassword: false, onChanged: (value){
            email = value;
          },),
          textField(text: "Password", isPassword: true,
          onChanged: (value){
            password = value;
          },
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Constant.textSecondary,
              width: 180,
              child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Constant.textBorder,
                          ))),
                  onPressed: () async {
                    try{
                      final newUser =
                      await auth.signInWithEmailAndPassword(email: email, password: password );
                      if(newUser != null && myVar != 0){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                      }
                    }catch(e){

                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.00,
                      color: Constant.textPrimary,
                    ),
                  )),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
