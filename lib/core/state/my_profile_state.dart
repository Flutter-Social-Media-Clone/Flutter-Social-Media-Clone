import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileState extends GetxController {
  var myselectedIndex = "posts".obs;
  var username = "".obs;
  var userData = {}.obs;
  var firstPersonId = "".obs;

  List<PostBase> myMedias = new RxList<PostBase>();
  List<PostBase> myPosts = new RxList<PostBase>();

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

  Future<void> getProfileCurrentUser() async {
    userData.value = await myFirestore.getUser(myAuth.getCurrentUser());
  }

  void setmyIndex(var index) {
    myselectedIndex.value = index;
  }

  Future getMyMedias() async {
    await getUserData();
    var a = await myFirestore.getMyMedias(myAuth.getCurrentUser());
    var b = List<PostBase>();
    a.forEach((k, item) {
      b.add(ImagePost(
        username: userData["username"],
        profileImage: NetworkImage(userData["imgUrl"]),
        image: NetworkImage(item),
        isMine: true,
        postId: k,
      ));
    });
    myMedias = b;
  }

  Future getMyPosts() async {
    await getUserData();
    var a = await myFirestore.getMyTextPosts(myAuth.getCurrentUser());
    var b = List<PostBase>();
    // print("TADAA" + a.toString());
    a.forEach((k, item) {
      // print("anan" + item);
      b.add(TextPost(
        username: userData["username"],
        profileImage: NetworkImage(userData["imgUrl"]),
        text: item,
        isMine: true,
        postId: k,
      ));
    });
    myPosts = b;
  }

  // List<PostBase> myPosts = [
  //   TextPost(
  //     username: "Kaya",
  //     profileImage: NetworkImage(
  //       "https://randomuser.me/api/portraits/women/4.jpg",
  //     ),
  //     text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
  //   ),
  //   TextPost(
  //     username: "Kaya",
  //     profileImage: NetworkImage(
  //       "https://randomuser.me/api/portraits/women/4.jpg",
  //     ),
  //     text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
  //   ),
  //   TextPost(
  //     username: "Kaya",
  //     profileImage: NetworkImage(
  //       "https://randomuser.me/api/portraits/women/4.jpg",
  //     ),
  //     text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
  //   ),
  // ].obs;
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
      print("POST");
      return myPosts;
    } else if (myselectedIndex.value == "medias") {
      print("POST");
      return myMedias;
    } else {
      return myLocations;
    }
  }
}
