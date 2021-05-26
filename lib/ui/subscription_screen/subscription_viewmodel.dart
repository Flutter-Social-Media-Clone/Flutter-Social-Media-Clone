import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubscriptionViewModel extends ChangeNotifier {
  List<SubscriptionResultBase> followers = [];
  List<SubscriptionResultBase> locationsubs = [];
  List<SubscriptionResultBase> topicsubs = [];
  List<SubscriptionResultBase> following = [];

  SubscriptionViewModel() {
    followers = [
      FollowersSubscription(
        id: "thirdPersonProfile",
        text: "Gulce",
        image: NetworkImage(
          "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
        ),
      ),
      FollowersSubscription(
        id: "hiddenProfile",
        text: "Mahmut_01",
        image: NetworkImage(
          "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
        ),
      ),
      FollowersSubscription(
        id: "hiddenProfile",
        text: "Takibetakipseritakip",
        image: NetworkImage(
          "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
        ),
      ),
    ];

    following = [
      FollowingSubscription(
        id: "thirdPersonProfile",
        text: "Skywalker",
        image: NetworkImage(
          "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
        ),
      ),
      FollowingSubscription(
        id: "hiddenProfile",
        text: "John Doe",
        image: NetworkImage(
          "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
        ),
      ),
      FollowingSubscription(
        id: "hiddenProfile",
        text: "SendekiBen",
        image: NetworkImage(
          "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
        ),
      ),
    ];

    topicsubs = [
      TopicSubscription(
        id: "thirdPersonProfile",
        text: "Huawei",
      ),
      TopicSubscription(
        id: "thirdPersonProfile",
        text: "İmamHatiplerKapatılsın",
      ),
      TopicSubscription(
        id: "hiddenProfile",
        text: "ÇevrimiçiEgitim",
      )
    ];

    locationsubs = [
      LocationSubscription(
        id: "thirdPersonProfile",
        text: "Kurtköy",
      ),
      LocationSubscription(
        id: "thirdPersonProfile",
        text: "Sabanci University",
      ),
      LocationSubscription(
        id: "hiddenProfile",
        text: "Mekke",
      ),
    ];

    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String _myselectedIndex = "locationsubs";
  String get myselectedIndex => _myselectedIndex;

  /*  String _selectedModetopic = "topicsubs";
  String get selectedMode => _selectedModetopic;

  String _selectedModefollowers = "followers";
  String get selectedFollower => _selectedModefollowers;

  String _selectedModefollowing = "following";
  String get selectedFollowing => _selectedModefollowing; */

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

/*   void setMode(String index) {
    _selectedModetopic = index;
    notifyListeners();
  }

  void setModeFollowers(String index) {
    _selectedModefollowers = index;
    notifyListeners();
  }

 void setModeFollowing(String index) {
    _selectedModefollowing = index;
    notifyListeners();
  } */

  void setmyIndex(String index) {
    _myselectedIndex = index; //location
    notifyListeners(); // <-- notify listeners
  }

  List<SubscriptionResultBase> getSubscriptionResult() {
    if (_myselectedIndex == "locationsubs") {
      return locationsubs;
    } else if (_myselectedIndex == "topicsubs") {
      return topicsubs;
    } else if (_myselectedIndex == "following") {
      return following;
    } else if (_myselectedIndex == "followers") {
      return followers;
    }
  }

  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
