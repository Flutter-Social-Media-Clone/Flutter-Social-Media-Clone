import 'package:cs310insta/core/models/postBase.dart';
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
  var topicPostsObx = <PostBase>[].obs;

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

  Future getTopicForSearch(String queryText) async {
    var topicPosts = await myFirestore.getTopicForSearch(queryText);
    var newTopicPosts = <PostBase>[];
    print("DENEME GELIYOR MU? $topicPosts");
    topicPosts.forEach((item) {
      if (item["type"] == "image") {
        newTopicPosts.add(ImagePost(
            username: item["username"],
            image: NetworkImage(item["postContent"]),
            profileImage: NetworkImage(
              item["profileImg"],
            )));
      } else {
        newTopicPosts.add(TextPost(
          username: item["username"],
          profileImage: NetworkImage(
            item["profileImg"],
          ),
          text: item["postContent"],
        ));
      }
    });

    topicPostsObx.value = newTopicPosts;
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
      text: "deneme2",
    ),
    LocationSearchResult(
      id: "thirdPersonProfile",
      text: "deneme3",
    ),
    LocationSearchResult(
      id: "hiddenProfile",
      text: "deneme4",
    ),
  ].obs;

  // List<SearchResultBase> topics = [
  //   TopicSearchResult(
  //     id: "thirdPersonProfile",
  //     text: "deneme",
  //   ),
  //   TopicSearchResult(
  //     id: "thirdPersonProfile",
  //     text: "deneme",
  //   ),
  //   TopicSearchResult(
  //     id: "hiddenProfile",
  //     text: "deneme",
  //   )
  // ].obs;

  dynamic getSearchResult() {
    update(peoples.value);
    update(topicPostsObx.value);
    if (selectedMode.value == "peoples") {
      return SearchResult(peoples.value);
    } else if (selectedMode.value == "topics") {
      return Posts(topicPostsObx.value);
    } else if (selectedMode.value == "locations") {
      return SearchResult(locations);
    }
  }

  // List<PostBase> getSearchTopicResult() {
  //   update(topicPostsObx.value);
  //   if (selectedMode.value == "topics") {
  //     return topicPostsObx;
  //   }

  //   return List<PostBase>();
  // }
}
