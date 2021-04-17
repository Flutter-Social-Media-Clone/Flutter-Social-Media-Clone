import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  List<SearchResultBase> peoples = [];
  List<SearchResultBase> locations = [];
  List<SearchResultBase> topics = [];
  SearchViewModel() {
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

  List<SearchResultBase> getContent() {
    if (_mode == "peoples") {
      return this.peoples;
    } else if (_mode == "topics") {
      return this.topics;
    } else if (_mode == "locations") {
      return this.locations;
    }
  }

  String _mode = "locations";

  String get mode => _mode;

  void setMode(String mode) {
    _mode = mode;
    notifyListeners();
  }

  // void increment() {
  //   _counter++;
  //   notifyListeners(); // <-- notify listeners
  // }
}
