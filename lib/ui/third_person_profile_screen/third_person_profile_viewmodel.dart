import 'package:cs310insta/core/models/postBase.dart';
import 'package:flutter/material.dart';

class ThirdPersonViewModel extends ChangeNotifier {
  List<PostBase> myMedias = [];
  List<PostBase> myLocations = [];
  List<PostBase> myPosts = [];

  ThirdPersonViewModel() {
    myMedias = [
      ImagePost(
        username: "Gulce",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      ImagePost(
        username: "Gulce",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      ImagePost(
        username: "Gulce",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];

    myPosts = [
      TextPost(
        username: "Gulce",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
      TextPost(
        username: "Gulce",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
      TextPost(
        username: "Gulce",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
    ];
    myLocations = [
      ImagePost(
        username: "Gulce",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];
  }

  String _myselectedIndex = "posts";
  String get myselectedIndex => _myselectedIndex;

  void setmyIndex(String index) {
    _myselectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  List<PostBase> getMyResults() {
    if (_myselectedIndex == "posts") {
      return myPosts;
    } else if (_myselectedIndex == "medias") {
      return myMedias;
    } else if (_myselectedIndex == "locations") {
      return myLocations;
    }
  }
}
