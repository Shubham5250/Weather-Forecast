import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: Constants.dayPrimary,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Positioned(
            top: size.height * 0.1,
            child: Row(
              children: <Widget>[
                Text('${Constants.apiInstance.city},',
                  style: TextStyle(
                  decoration: TextDecoration.none,
                    color: Colors.orange,
                    fontSize: 45,
                  ),
                ),

                Text('${Constants.apiInstance.country}',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Constants.textPrimary,
                  fontSize: 35,
                ),),
              ],
            ),
          ),

          Positioned(
            top: size.height * 0.17,
            child: Text(
              '${Constants.apiInstance.date}',
              style: TextStyle(
                color: Constants.textPrimary,
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            child: Text(
              '${Constants.apiInstance.temp}°c',
              style: TextStyle(
                color: Colors.orange,
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.7,
            child: Text(
              '${Constants.apiInstance.tempDescp}',
              style: TextStyle(
                color: Constants.textPrimary,
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * .23,
              child: Image.network(
                  'http://openweathermap.org/img/wn/${Constants.apiInstance
                      .icon}@2x.png'),
            ),
          ),
          Positioned(
            bottom: size.height * 0.03,
            child: Row(
              children: [
                bottomWidget(
                    name: 'Max temp',
                    value: '${Constants.apiInstance.temp} °c',
                    icon: Icons.thermostat,
                    size: size),
                bottomWidget(
                    name: 'Air Speed',
                    value: '${Constants.apiInstance.airSpeed} m/s',
                    icon: Icons.air_outlined,
                    size: size),
                bottomWidget(
                    name: 'Humidity',
                    value: '${Constants.apiInstance.humidity} %',
                    icon: Icons.percent,
                    size: size),
              ],
            ),
          )
        ],
      ),

    );
  }
}

class bottomWidget extends StatelessWidget {
  const bottomWidget({super.key,
    required this.name,
    required this.value,
    required this.icon,
    required this.size});

  final String name;
  final String value;
  final IconData icon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.3,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.orange,
          ),
          Text(
            name,
            style: TextStyle(
              color: Constants.textPrimary,
              decoration: TextDecoration.none,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.none,
              color: Constants.textPrimary,
            ),
          )
        ],
      ),
    );
  }
}
