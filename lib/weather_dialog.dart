import 'package:flutter/material.dart';
import 'weather_icons.dart';

class WeatherDialog extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String weatherDescription;
  final String weatherIcon;

  const WeatherDialog({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        backgroundColor: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.blue,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      child: AlertDialog(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Weather in $cityName'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temperature,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10),
              Text(
                weatherDescription,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 20),
              buildWeatherIcon(weatherIcon),
            ],
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget buildWeatherIcon(String iconCode) {
    return Icon(
      getIcon(iconCode),
      size: 40.0,
      color: Colors.white,
    );
  }
}
