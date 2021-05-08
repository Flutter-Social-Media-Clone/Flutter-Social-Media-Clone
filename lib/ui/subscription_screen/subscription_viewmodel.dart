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
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowersSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowersSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];
    following = [
      FollowingSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowingSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowingSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];

    topicsubs = [
      TopicSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      TopicSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      TopicSubscription(
        id: "hiddenProfile",
        text: "deneme",
      )
    ];
    locationsubs = [
      LocationSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      LocationSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      LocationSubscription(
        id: "hiddenProfile",
        text: "deneme",
      ),
    ];

  SubscriptionViewModel() {
    followers = [
      FollowersSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowersSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowersSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];
    following = [
      FollowingSubscription(
        id: "thirdPersonProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowingSubscription(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      FollowingSubscription (
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];
    topicsubs = [
      TopicSubscription(
        text: "deneme",
      ),
      TopicSubscription(
        text: "deneme",
      ),
      TopicSubscription(
        text: "deneme",
      )
    ];
    locationsubs = [
      LocationSubscription(
        text: "deneme",
      ),
      LocationSubscription(
        text: "deneme",
      ),
      LocationSubscription(
        text: "deneme",
      ),
    ];

    notifyListeners();
  }
  

}
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String _myselectedIndex = "locationsubs";
  String get myselectedIndex => _myselectedIndex;

  String _selectedModetopic = "topicsubs";
  String get selectedMode => _selectedModetopic;

  String _selectedModefollowers = "followers";
  String get selectedFollower => _selectedModefollowers;

  String _selectedModefollowing = "following";
  String get selectedFollowing => _selectedModefollowing;


  
  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  void setMode(String index) {
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
  }


  void setmyIndex(String index) {
    _myselectedIndex = index; //location
    notifyListeners(); // <-- notify listeners
  }

  List<SubscriptionResultBase> getSubscriptionResult() {
    if (_myselectedIndex == "locationsubs") {
      return locationsubs;
    } else if (_selectedModetopic == "topicsubs") {
      return topicsubs;
    } else if (_selectedModefollowing == "following") {
      return following;
     } else if (_selectedModefollowers == "followers") {
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

