import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchState extends GetxController {
  final MyFirestore myFirestore = Get.put(MyFirestore());

  var selectedMode = "peoples".obs;
  var topic1 = "".obs;
  var topic2 = "".obs;
  var topic3 = "".obs;

  var peoples = <SearchResultBase>[].obs;

  void setMode(var index) {
    selectedMode.value = index;
  }

  handleSaveTopic1(value) {
    topic1.value = value;
  }

  handleSaveTopic2(value) {
    topic2.value = value;
  }

  handleSaveTopic3(value) {
    topic3.value = value;
  }

  Future getPeopleForSearch(String queryText) async {
    var people = await myFirestore.getPeopleForSearch(queryText);
    var newPeople = <SearchResultBase>[];
    people.forEach((item) {
      newPeople.add(PeopleSearchResult(
        id: "/thirdPersonProfile/${item["userId"]}",
        text: item["username"],
        image: NetworkImage(item["imgUrl"]),
      ));
    });
    peoples.value = newPeople;
  }

  // List<SearchResultBase> peoples = [
  //   PeopleSearchResult(
  //     id: "/thirdPersonProfile/bdEH0CnOYSdNSHr3ZBpII1CCSP83",
  //     text: "deneme",
  //     image: NetworkImage(
  //       "https://randomuser.me/api/portraits/women/3.jpg",
  //     ),
  //   ),
  //   PeopleSearchResult(
  //     id: "/hiddenProfile/dayg73p0slfbT89IaWhPamSy71x1",
  //     text: "deneme",
  //     image: NetworkImage(
  //       "https://randomuser.me/api/portraits/women/3.jpg",
  //     ),
  //   ),
  //   PeopleSearchResult(
  //     id: "/hiddenProfile/dayg73p0slfbT89IaWhPamSy71x1",
  //     text: "deneme",
  //     image: NetworkImage(
  //       "https://randomuser.me/api/portraits/women/3.jpg",
  //     ),
  //   ),
  // ].obs;

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
    update(peoples.value);
    if (selectedMode.value == "peoples") {
      return peoples;
    } else if (selectedMode.value == "locations") {
      return locations;
    } else {
      return topics;
    }
  }
}
