import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeViewModel extends ChangeNotifier {
  // <-- extends ChangeNotifier
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }

  void navigate_login(context) {
    Navigator.pushNamed(context, "/login");
  }

  void navigate_signup(context) {
    Navigator.pushNamed(context, "/signup");
  }
}
