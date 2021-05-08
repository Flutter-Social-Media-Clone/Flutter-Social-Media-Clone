import 'package:cs310insta/core/models/postBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileState extends GetxController {
  var myselectedIndex = "posts".obs;

  void setmyIndex(var index) {
    myselectedIndex.value = index;
  }

  List<PostBase> myMedias = [
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
  ].obs;

  List<PostBase> myPosts = [
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
  ].obs;
  List<PostBase> myLocations = [
    ImagePost(
      username: "Kaya",
      image: NetworkImage(
        "https://randomuser.me/api/portraits/women/4.jpg",
      ),
      profileImage: NetworkImage(
        "https://randomuser.me/api/portraits/women/3.jpg",
      ),
    ),
  ].obs;

  List<PostBase> getMyResults() {
    if (myselectedIndex.value == "posts") {
      return myPosts;
    } else if (myselectedIndex.value == "medias") {
      return myMedias;
    } else {
      return myLocations;
    }
  }
}
