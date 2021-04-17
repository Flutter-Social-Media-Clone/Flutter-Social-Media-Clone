import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainAppViewModel extends ChangeNotifier {
  List<SearchResultBase> peoples = [];
  List<SearchResultBase> locations = [];
  List<SearchResultBase> topics = [];

  List<PostBase> myMedias = [];
  List<PostBase> myLocations = [];
  List<PostBase> myPosts = [];

  MainAppViewModel() {
    peoples = [
      PeopleSearchResult(
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      PeopleSearchResult(
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      PeopleSearchResult(
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];

    topics = [
      TopicSearchResult(
        text: "deneme",
      ),
      TopicSearchResult(
        text: "deneme",
      ),
      TopicSearchResult(
        text: "deneme",
      )
    ];
    locations = [
      LocationSearchResult(
        text: "deneme",
      ),
      LocationSearchResult(
        text: "deneme",
      ),
      LocationSearchResult(
        text: "deneme",
      ),
    ];

    myMedias = [
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      ImagePost(
        username: "Kaya",
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
        username: "Kaya",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
      TextPost(
        username: "Kaya",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
      TextPost(
        username: "Kaya",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
    ];
    myLocations = [
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String _myselectedIndex = "posts";
  String get myselectedIndex => _myselectedIndex;

  // int getSelectedIndex2() {
  //   print("called 2 ==> $selectedIndex");
  //   return selectedIndex;
  // }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

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

  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //Widget get pageWidget => _widgetOptions.elementAt(_selectedIndex);

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
