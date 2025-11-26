import 'package:flutter/material.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather_alert.dart';

enum ForecastSection { today, hourly, monthly }

enum WeatherStatus { sunny, cloudy, rainy, storm, snow, windy, fog }

class HomeProvider extends ChangeNotifier {
  final List<WeatherAlert> alerts = [];

  ForecastSection selectedSection = ForecastSection.today;

  // Dummy data – replace with API data later
  final todayItems = [
    HourData('10 am', 16, WeatherStatus.cloudy),
    HourData('11 am', 17, WeatherStatus.rainy),
    HourData('12 pm', 18, WeatherStatus.storm),
    HourData('01 pm', 19, WeatherStatus.cloudy),
  ];

  final List<HourData> hourlyItems = [
    HourData('10 am', 16, WeatherStatus.cloudy),
    HourData('11 am', 17, WeatherStatus.rainy),
    HourData('12 pm', 18, WeatherStatus.storm),
    HourData('01 pm', 19, WeatherStatus.cloudy),
  ];

  final List<HourData> monthlyItems = [
    HourData('jan', 16, WeatherStatus.cloudy),
    HourData('feb', 16, WeatherStatus.rainy),
    HourData('march', 16, WeatherStatus.cloudy),
    HourData('april', 16, WeatherStatus.windy),
    HourData('may', 16, WeatherStatus.cloudy),
    HourData('june', 16, WeatherStatus.cloudy),
    HourData('july', 16, WeatherStatus.cloudy),
    HourData('aug', 16, WeatherStatus.cloudy),
    HourData('sep', 16, WeatherStatus.cloudy),
    HourData('oct', 16, WeatherStatus.cloudy),
    HourData('nov', 16, WeatherStatus.cloudy),
    HourData('dec', 16, WeatherStatus.cloudy),
  ];

  final hourItems = [
    HourData('10 am', 16, WeatherStatus.cloudy),
    HourData('11 am', 17, WeatherStatus.rainy),
    HourData('12 pm', 18, WeatherStatus.storm),
    HourData('01 pm', 19, WeatherStatus.cloudy),
    HourData('10 am', 16, WeatherStatus.cloudy),
    HourData('11 am', 17, WeatherStatus.rainy),
    HourData('12 pm', 18, WeatherStatus.storm),
    HourData('01 pm', 19, WeatherStatus.cloudy),
    HourData('10 am', 16, WeatherStatus.cloudy),
    HourData('11 am', 17, WeatherStatus.rainy),
    HourData('12 pm', 18, WeatherStatus.storm),
    HourData('01 pm', 19, WeatherStatus.cloudy),
  ];

  List<HourData> get currentItems {
    switch (selectedSection) {
      case ForecastSection.today:
        return todayItems;
      case ForecastSection.hourly:
        return hourlyItems;
      case ForecastSection.monthly:
        return monthlyItems;
    }
  }

  void setSection(ForecastSection section) {
    if (section == selectedSection) return;
    selectedSection = section;
    notifyListeners();
  }

  void addAlert(WeatherAlert alert) {
    alerts.add(alert);
    notifyListeners();
  }
}
