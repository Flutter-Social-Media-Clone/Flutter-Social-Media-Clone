import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalkthroughState extends GetxController {
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

  var current = 0.obs;
  int pageCount = 6;

  void setCurrent(var index) {
    current.value = index;
  }

  double getHeight() {
    return Get.height;
  }

  void setSeenTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
  }
}
