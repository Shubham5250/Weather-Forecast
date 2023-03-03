import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/mainScreen.dart';
import 'package:untitled/Screens/loginscreen.dart';
import 'package:untitled/Screens/splashScreen.dart';
import 'Network/Location.dart';
import '../constants.dart' as Constants;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform );



  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // final bool isLoggedIn;
  const MyApp( {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {   //build context helps to identify controller to build widgets
    return MaterialApp(               // MaterialApp widget is the main screen of the app
      debugShowCheckedModeBanner: false,
        home: Splash(),

    );
  }
}

