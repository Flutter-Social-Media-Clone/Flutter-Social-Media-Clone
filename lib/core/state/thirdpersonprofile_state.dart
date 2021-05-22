import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPersonProfileState extends GetxController {
  final formKey = GlobalKey<FormState>();
  var myselectedIndex = "username".obs;
  var username = "".obs;
  var userData = {}.obs;

  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MyAuth myAuth = Get.put(MyAuth());

  Future<void> getUsername() async {
    var data = await myFirestore.getUser(myAuth.getCurrentUser());
    username.value = data["username"].toString();

    print(data);
  }

  Future<void> getUserData() async {
    userData.value = await myFirestore.getUser(myAuth.getCurrentUser());
  }

  var storage = FirebaseStorage.instance;
  var myShareIndex = "username".obs;
  
  void setmyIndex(var index) {
    myShareIndex.value = index;
  }


 
  void handleBookmark() async {
      if (formKey.currentState.validate()) {
      print("Handle Bookmark tapped!");
      formKey.currentState.save();
      print(username);

    } 
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
