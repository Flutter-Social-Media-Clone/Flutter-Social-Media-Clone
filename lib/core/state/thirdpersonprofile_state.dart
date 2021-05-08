import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/models/postBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPersonProfileState extends GetxController {
  var myselectedIndex = "posts".obs;

  void setmyIndex(var index) {
    myselectedIndex.value = index;
  }

  List<PostBase> getMyResults() {
    if (myselectedIndex.value == "posts") {
      return myPosts;
    } else if (myselectedIndex.value == "medias") {
      return myMedias;
    } else {
      return myLocations;
    }
  }

  List<PostBase> myMedias = [
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
  ].obs;

  List<PostBase> myPosts = [
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
  ].obs;

  List<PostBase> myLocations = [
    ImagePost(
      username: "Gulce",
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/4.jpg",
      ),
      profileImage: NetworkImage(
        "https://randomuser.me/api/portraits/women/3.jpg",
      ),
    ),
  ].obs;
}
