import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String username = "Guest";

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }
}
