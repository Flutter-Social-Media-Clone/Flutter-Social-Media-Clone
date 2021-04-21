import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessagePageModel extends ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  var refreshkey = GlobalKey<RefreshIndicatorState>();
  var list;
  var random;

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
