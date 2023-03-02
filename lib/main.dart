import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/mainScreen.dart';
import 'package:untitled/Screens/loginscreen.dart';
import 'Network/Location.dart';
import '../constants.dart' as Constants;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform );

  await apiCall();

  runApp(MyApp(isLoggedIn: isLoggedIn));

}

int myvar=1;

Future<void> apiCall() async {
  var location = await determinePosition();

  myvar = await Constants.apiInstance.getLocation(
      location.latitude.toString(), location.longitude.toString());
  print(location.latitude.toString());
}
class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp( {super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {   //build context helps to identify controller to build widgets
    return MaterialApp(               // MaterialApp widget is the main screen of the app
      debugShowCheckedModeBanner: false,
        home: isLoggedIn ? const MainScreen() : const LoginScreen()

    );
  }
}

