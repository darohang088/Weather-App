import 'package:flutter/material.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather_alert.dart';

enum ForecastSection { today, hourly, monthly }

class HomeProvider extends ChangeNotifier {
  String username = "Guest";

  final List<WeatherAlert> alerts = [];

  ForecastSection selectedSection = ForecastSection.today;

  // Dummy data – replace with API data later
  final List<HourData> todayItems = [
    HourData('10 am', 16, Icons.cloud_queue),
    HourData('11 am', 17, Icons.cloudy_snowing),
    HourData('12 pm', 18, Icons.thunderstorm_outlined),
    HourData('01 pm', 19, Icons.cloudy_snowing),
  ];

  final List<HourData> hourlyItems = [
    HourData('02 pm', 20, Icons.cloud_queue),
    HourData('03 pm', 21, Icons.cloud_outlined),
    HourData('04 pm', 22, Icons.cloudy_snowing),
    HourData('05 pm', 23, Icons.thunderstorm_outlined),
  ];

  final List<HourData> monthlyItems = [
    HourData('Mon', 24, Icons.wb_cloudy_outlined),
    HourData('Tue', 25, Icons.wb_sunny_outlined),
    HourData('Wed', 26, Icons.cloudy_snowing),
    HourData('Thu', 27, Icons.thunderstorm_outlined),
  ];

  final hourItems = [
    HourData('10 am', 16, Icons.cloud_queue),
    HourData('11 am', 17, Icons.cloudy_snowing),
    HourData('12 pm', 18, Icons.thunderstorm_outlined),
    HourData('01 pm', 19, Icons.cloudy_snowing),
    HourData('02 pm', 19, Icons.cloudy_snowing),
    HourData('03 pm', 19, Icons.cloudy_snowing),
    HourData('04 pm', 19, Icons.cloudy_snowing),
    HourData('05 pm', 19, Icons.cloudy_snowing),
    HourData('06 pm', 19, Icons.cloudy_snowing),
    HourData('07 pm', 19, Icons.cloudy_snowing),
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

  void setUsername(String value) {
    username = value;
    notifyListeners();
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
