import 'package:flutter/material.dart';
import 'package:weather_app/providers/user_provider.dart';

IconData weatherStatusToIcon(WeatherStatus status) {
  switch (status) {
    case WeatherStatus.sunny:
      return Icons.wb_sunny;
    case WeatherStatus.cloudy:
      return Icons.cloud;
    case WeatherStatus.rainy:
      return Icons.umbrella;
    case WeatherStatus.storm:
      return Icons.thunderstorm;
    case WeatherStatus.snow:
      return Icons.ac_unit;
    case WeatherStatus.windy:
      return Icons.air;
    case WeatherStatus.fog:
      return Icons.water_drop; // or fog icon if available
  }
}
