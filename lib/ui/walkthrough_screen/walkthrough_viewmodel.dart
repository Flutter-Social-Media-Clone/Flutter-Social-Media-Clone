import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalkthroughViewModel extends ChangeNotifier {
  final List<String> imgList = [
    "assets/images/cat_hi.gif",
    "assets/images/cat_follow.gif",
    "assets/images/cat_match.gif",
    "assets/images/cat_chat.gif",
    "assets/images/cat_meet.gif",
    "assets/images/cat_review.gif",
  ];

  final List<String> headerList = [
    "Welcome to Our App!",
    "Follow People You Like!",
    "Get Matched!",
    "Chat With People!",
    "Meet With People!",
    "Review People!",
  ];

  final List<String> subheaderList = [
    "Let’s see a quick overview of our features!",
    "Don’t miss anything!",
    "Ready to find someone right for you? We’re right there with you.",
    "Talk one-on-one with people",
    "Nail the first date!",
    "Rate people you know!",
  ];

  int current = 0;
  int page_count = 6;

  void setCurrent(int index) {
    current = index;
    notifyListeners(); // <-- notify listeners
  }

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }

  double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  void setSeenTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
    notifyListeners();
  }
}
