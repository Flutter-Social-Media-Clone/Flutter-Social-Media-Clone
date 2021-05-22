import 'package:cs310insta/core/state/analytics.dart';
import 'package:get/get.dart';

class BottomNavigationState extends GetxController {
  var selectedIndex = 1.obs;

  final MyAnalytics myAnalytics = Get.put(MyAnalytics());

  void onItemTapped(var index) {
    selectedIndex.value = index;
    myAnalytics
        .mySetCurrentScreen("main app screen index: " + index.toString());
  }

  void onItemNavigatorTapped(var index) {
    selectedIndex.value = index;

    myAnalytics
        .mySetCurrentScreen("main app screen index: " + index.toString());
  }
}
