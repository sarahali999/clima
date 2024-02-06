import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'weather_dialog.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final cityController = TextEditingController();
  String temperature = '';
  String weatherDescription = '';
  String weatherIcon = '';

  Future<void> getWeather(String cityName) async {
    final apiKey = '8a95f1842efc4c6dc8b439611e5a5eb3';
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

    final response = await http.get(Uri.parse('$apiUrl?q=$cityName&appid=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        temperature = '${data['main']['temp']}°C';
        weatherDescription = data['weather'][0]['description'];
        weatherIcon = data['weather'][0]['icon'];
        showWeatherDialog();
      });
    } else {
      setState(() {
        temperature = 'Failed to get temperature. Please try again.';
      });
    }
  }

  void showWeatherDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WeatherDialog(
          cityName: cityController.text,
          temperature: temperature,
          weatherDescription: weatherDescription,
          weatherIcon: weatherIcon,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/i6.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Weather App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Check the current weather conditions for any city.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: cityController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.blue),
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final cityName = cityController.text;
                  if (cityName.isNotEmpty) {
                    getWeather(cityName);
                  }
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
