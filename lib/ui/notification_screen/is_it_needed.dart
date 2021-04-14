import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainAppViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
