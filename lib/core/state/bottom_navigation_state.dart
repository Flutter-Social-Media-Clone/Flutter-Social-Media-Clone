import 'package:cs310insta/core/state/analytics.dart';
import 'package:cs310insta/core/state/my_profile_state.dart';
import 'package:get/get.dart';

class BottomNavigationState extends GetxController {
  var selectedIndex = 1.obs;

  final MyAnalytics myAnalytics = Get.put(MyAnalytics());
  final MyProfileState myProfileState = Get.put(MyProfileState());
  void onItemTapped(var index) {
    selectedIndex.value = index;
    myAnalytics
        .mySetCurrentScreen("main app screen index: " + index.toString());
    if (index == 4) {
      myProfileState.getMyMedias();
      myProfileState.getMyPosts();
    }
  }

  void onItemNavigatorTapped(var index) {
    selectedIndex.value = index;

    myAnalytics
        .mySetCurrentScreen("main app screen index: " + index.toString());
  }
}
