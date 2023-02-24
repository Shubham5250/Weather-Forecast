import 'package:flutter/material.dart';
import '../Components/textField.dart';
import '../constants.dart' as Constant;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LogiunScreenState();
}

class _LogiunScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.textPrimary,
      body: Column(
        children: [
          Expanded(child: Container()),
         Image.network(
                'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyT2?ver=7fed'),

         textField(text:"E-mail",isPassword: false),

          textField(text: "Password", isPassword: true),
           textField(text: "Mobile Number", isPassword: false),
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

                      )
                    )
                  ),
                  onPressed: (){}, child: Text('Login',
              style: TextStyle(
                fontSize: 24.00,
                color: Constant.textPrimary,
              ),)),
            ),
          ),
          Expanded(
              child: Container()),
        ],
      ),
    );
  }
}

