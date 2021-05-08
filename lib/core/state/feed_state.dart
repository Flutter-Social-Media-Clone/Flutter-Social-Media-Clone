import 'package:cs310insta/core/models/postBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedState extends GetxController {
  List<PostBase> posts = [
    ImagePost(
      username: "Gokberk",
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/4.jpg",
      ),
      profileImage: NetworkImage(
        "https://randomuser.me/api/portraits/women/3.jpg",
      ),
    ),
    TextPost(
        username: "Gokberk",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"),
    TextPost(
        username: "Gokberk",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"),
  ].obs;
}
