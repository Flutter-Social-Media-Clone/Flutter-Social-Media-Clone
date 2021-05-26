import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionState extends GetxController {
  final MyFirestore myFirestore = Get.put(MyFirestore());

  var myselectedIndex = "locationsubs".obs;
  var selectedIndex = 0.obs;

//   var peoples = <SearchResultBase>[].obs;
//   var topicPostsObx = <PostBase>[].obs;
  var followers = <SubscriptionResultBase>[].obs;
  var following = <SubscriptionResultBase>[].obs;
  var locationsubs = <SubscriptionResultBase>[].obs;
  var topicsubs = <SubscriptionResultBase>[].obs;

  void setmyIndex(var index) {
    myselectedIndex.value = index;
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Future getFollowers(String to) async {
    var tempFollowers = await myFirestore.getFollowers(to);
    var followersLocal = <SubscriptionResultBase>[];
    tempFollowers.forEach((item) {
      followersLocal.add(FollowersSubscription(
        id: item["userId"],
        text: item["username"],
        image: NetworkImage(item["imgUrl"]),
      ));
    });
    followers.value = followersLocal;
  }

  // FollowersSubscription(
  //   id: "hiddenProfile",
  //   text: "Takibetakipseritakip",
  //   image: NetworkImage(
  //     "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
  //   ),
  // ),

  //  FollowingSubscription(
  //   id: "thirdPersonProfile",
  //   text: "Skywalker",
  //   image: NetworkImage(
  //     "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
  //   ),
  // ),

  Future getFollowing(String from) async {
    var tempFollowing = await myFirestore.getFollowing(from);
    var followingLocal = <SubscriptionResultBase>[];
    tempFollowing.forEach((item) {
      print("GETTTTTTT FOLLOWINGG $item");
      followingLocal.add(FollowingSubscription(
        id: item["userId"],
        text: item["username"],
        image: NetworkImage(item["imgUrl"]),
      ));
    });
    following.value = followingLocal;
  }

  // FollowingSubscription(
  //       id: "thirdPersonProfile",
  //       text: "Skywalker",
  //       image: NetworkImage(
  //         "https://pbs.twimg.com/profile_images/1169595630706208771/T75ayGDO_400x400.jpg",
  //       ),
  //     ),

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

  List<SubscriptionResultBase> getSubscriptionResult() {
    update(following.value);
    update(followers.value);
    if (myselectedIndex.value == "locationsubs") {
      return locationsubs;
    } else if (myselectedIndex.value == "topicsubs") {
      return topicsubs;
    } else if (myselectedIndex.value == "following") {
      print("final step following, $following");

      return following;
    } else if (myselectedIndex.value == "followers") {
      return followers;
    }
  }
}
