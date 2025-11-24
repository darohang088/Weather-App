import 'package:flutter/material.dart';
import 'package:weather_app/pages/detail_page.dart';
import 'package:weather_app/pages/home_page.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/detail';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
      login: (context) => const DetailPage(),
    };
  }
}
