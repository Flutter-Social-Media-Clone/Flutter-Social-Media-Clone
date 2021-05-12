import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class MyAnalytics extends GetxController {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  Future<void> mySetCurrentScreen(String screenName) async {
    try {
      await analytics.setCurrentScreen(screenName: screenName);
      print("screen name: " + screenName + " setted as current screen");
    } catch (e) {
      print("ERROR while setting current screen " + screenName + ": " + e);
    }
  }
}
