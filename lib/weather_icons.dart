import 'package:flutter/material.dart';

class WeatherForecast {
  final String day;
  final String temperature;
  final String description;
  final String icon;

  WeatherForecast({
    required this.day,
    required this.temperature,
    required this.description,
    required this.icon,
  });
}

IconData getIcon(String code) {
  switch (code) {
    case '01d':
      return Icons.wb_sunny;
    case '01n':
      return Icons.nights_stay;
    case '02d':
    case '02n':
      return Icons.cloud;
    case '03d':
    case '03n':
      return Icons.cloud_queue;
    case '04d':
    case '04n':
      return Icons.cloud_off;
    case '09d':
    case '09n':
      return Icons.grain;
    case '10d':
    case '10n':
      return Icons.beach_access;
    case '11d':
    case '11n':
      return Icons.flash_on;
    case '13d':
    case '13n':
      return Icons.ac_unit;
    case '50d':
    case '50n':
      return Icons.blur_on;
    default:
      return Icons.wb_cloudy;
  }
}
