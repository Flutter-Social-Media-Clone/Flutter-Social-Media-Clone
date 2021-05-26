import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedState extends GetxController {
  var posts = <PostBase>[].obs;
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MyAuth myAuth = Get.put(MyAuth());

  Future getMyFeed(String queryText) async {
    var tempFeedPosts = await myFirestore.getFeed(myAuth.getCurrentUser());
    var feedPosts = <PostBase>[];
    print("DENEME GELIYOR MU? $tempFeedPosts");
    tempFeedPosts.forEach((item) {
      if (item["type"] == "image") {
        feedPosts.add(ImagePost(
            username: item["username"],
            image: NetworkImage(item["postContent"]),
            profileImage: NetworkImage(
              item["profileImg"],
            )));
      } else {
        feedPosts.add(TextPost(
          username: item["username"],
          profileImage: NetworkImage(
            item["profileImg"],
          ),
          text: item["postContent"],
        ));
      }
    });

    posts.value = feedPosts;
  }
}
