import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessageCardViewModel extends ChangeNotifier {
  int _counter = 0;
  // int selectedIndex = 0;

  // void onItemTapped(int index) {
  //   selectedIndex = index;
  //   notifyListeners(); // <-- notify listeners
  // }

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
