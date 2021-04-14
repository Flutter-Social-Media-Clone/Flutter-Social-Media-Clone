import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainAppViewModel extends ChangeNotifier {
  List<SearchResultBase> peoples = [];
  List<SearchResultBase> locations = [];
  List<SearchResultBase> topics = [];
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

    notifyListeners();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  // int getSelectedIndex2() {
  //   print("called 2 ==> $selectedIndex");
  //   return selectedIndex;
  // }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners(); // <-- notify listeners
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
