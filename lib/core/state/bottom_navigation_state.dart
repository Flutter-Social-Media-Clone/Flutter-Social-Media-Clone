import 'package:get/get.dart';

class BottomNavigationState extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(var index) {
    selectedIndex.value = index;
  }

  void onItemNavigatorTapped(var index) {
    selectedIndex.value = index;
  }
}
