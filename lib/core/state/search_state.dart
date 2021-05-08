import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchState extends GetxController {
  var selectedMode = "peoples".obs;

  void setMode(var index) {
    selectedMode.value = index;
  }

  List<SearchResultBase> peoples = [
    PeopleSearchResult(
      id: "thirdPersonProfile",
      text: "deneme",
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/3.jpg",
      ),
    ),
    PeopleSearchResult(
      id: "hiddenProfile",
      text: "deneme",
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/3.jpg",
      ),
    ),
    PeopleSearchResult(
      id: "hiddenProfile",
      text: "deneme",
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/3.jpg",
      ),
    ),
  ].obs;

  List<SearchResultBase> locations = [
    LocationSearchResult(
      id: "thirdPersonProfile",
      text: "deneme",
    ),
    LocationSearchResult(
      id: "thirdPersonProfile",
      text: "deneme",
    ),
    LocationSearchResult(
      id: "hiddenProfile",
      text: "deneme",
    ),
  ].obs;

  List<SearchResultBase> topics = [
    TopicSearchResult(
      id: "thirdPersonProfile",
      text: "deneme",
    ),
    TopicSearchResult(
      id: "thirdPersonProfile",
      text: "deneme",
    ),
    TopicSearchResult(
      id: "hiddenProfile",
      text: "deneme",
    )
  ].obs;

  List<SearchResultBase> getSearchResult() {
    if (selectedMode.value == "peoples") {
      return peoples;
    } else if (selectedMode.value == "locations") {
      return locations;
    } else {
      return topics;
    }
  }
}
