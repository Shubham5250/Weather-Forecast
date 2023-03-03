import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/mainScreen.dart';
import 'package:untitled/main.dart';
import 'package:lottie/lottie.dart';
import '../Network/Location.dart';
import '../constants.dart' as Constants;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final prefs = await SharedPreferences.getInstance();
//   final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//
//   }

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int myvar = 1;

  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  apiCall() async {
    var location = await determinePosition();

    myvar = await Constants.apiInstance.getLocation(
        location.latitude.toString(), location.longitude.toString());
    print(location.latitude.toString());
  }

  _navigateToLogin() async {
    await apiCall();
    //replace the splash screen
    Navigator.pushReplacement(
        this.context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'animations/splash.json',
            repeat: true,
            fit: BoxFit.cover,
          ),
          Text(
            "Fetching weather data...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Ubuntu'
            ),
          )
        ],
      ),
    );
  }
}
