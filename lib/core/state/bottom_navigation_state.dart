import 'package:cs310insta/core/state/analytics.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/my_profile_state.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:get/get.dart';

class BottomNavigationState extends GetxController {
  var selectedIndex = 1.obs;

  final MyAnalytics myAnalytics = Get.put(MyAnalytics());
  final MyProfileState myProfileState = Get.put(MyProfileState());
  final FeedState feedState = Get.put(FeedState());
  final MyAuth myAuth = Get.put(MyAuth());
  void onItemTapped(var index) {
    selectedIndex.value = index;
    myAnalytics
        .mySetCurrentScreen("main app screen index: " + index.toString());
    if (index == 4) {
      myProfileState.getMyMedias();
      myProfileState.getMyPosts();
    }
    if (index == 1) {
      feedState.getMyFeed(myAuth.getCurrentUser());
    }
  }

  void onItemNavigatorTapped(var index) {
    selectedIndex.value = index;

    myAnalytics
        .mySetCurrentScreen("main app screen index: " + index.toString());
  }
}
