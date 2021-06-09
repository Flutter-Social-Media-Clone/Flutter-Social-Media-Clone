import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPersonProfileState extends GetxController {
  final formKey = GlobalKey<FormState>();
  var myselectedIndex = "posts".obs;
  var username = "".obs;
  var userData = {}.obs;
  var thirdUserId = "".obs;
  var bookmarked = "".obs;

  var friendShipStatus = false.obs;

  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MyAuth myAuth = Get.put(MyAuth());

  final String userId = Get.parameters["userId"];

  List<PostBase> userMedias = new RxList<PostBase>();
  List<PostBase> userPosts = new RxList<PostBase>();

  Future<void> getUsername() async {
    //DONE: myAuth.getCurrentUser() --> userId
    var data = await myFirestore.getUser(myAuth.getCurrentUser());
    username.value = data["username"].toString();

    print(data);
  }

  Future<void> getUserData() async {
    //DONE: myAuth.getCurrentUser() --> userId
    thirdUserId.value = userId;
    print("TRIAL USER ID ON THIRD PROFILE ${thirdUserId.value}");
    userData.value = await myFirestore.getUser(thirdUserId.value);
  }

  // var storage = FirebaseStorage.instance;
  // var myShareIndex = "username".obs;

  void setmyIndex(var index) {
    myselectedIndex.value = index;
  }

  //bool isBookmarked = false;
 Future<void> handleBookmark() async {
    //bookMark(thirdUserId, username, String uid) {
    var data = await myFirestore.getUser( myAuth.getCurrentUser());
    username.value = data["username"].toString(); //curent user
    print(data);
    //bookmarked.value = await myFirestore.getbookmarked(username, bookmarked, uid);
   
    var data1 = await myFirestore.getUser(userId);
    bookmarked.value = data1["bookmarked"].toString(); //bookmarked person (thirdperson)
    print(data1);
    //isBookmarked = true;
    //return bookmarked.value;
}




  //TODO: bu fireStore_state'e bir daha yazılmalı
  // Future<bool> handleBookmark() async {

  //   var userid = await myFirestore.getUser(myAuth.getCurrentUser());
    
  //   print("Handle Bookmark tapped!");

  //   formKey.currentState.save();
  //   print(userid);
  //   return true;
  // }

// bool isBookmarked;
// Future<void> handleBookmark() async {

  
// //   Future<void> querySnapshot = FirebaseFirestore.instance.collection('bookmarks').doc('username').get();
// //   var doc = await myFirestore.bookMark();

// //   if (doc['bookmarkedby'].getUser(userId)) {
// //       isBookmarked = true;
// //   } else {
// //     isBookmarked = false;
// // }

// }

  Future getUserMedias() async {
    await getUserData();
    var a = await myFirestore.getMyMedias(thirdUserId.value);
    var b = List<PostBase>();
    a.forEach((k, item) {
      print("get user medias:" + item);
      b.add(ImagePost(
        username: userData["username"],
        profileImage: NetworkImage(userData["imgUrl"]),
        image: NetworkImage(item),
        isMine: false,
        postId: k,
      ));
    });
    userMedias = b;
  }

  Future getUserPosts() async {
    await getUserData();
    var a = await myFirestore.getMyTextPosts(thirdUserId.value);
    var b = List<PostBase>();
    // print("TADAA" + a.toString());
    a.forEach((k, item) {
      // print("anan" + item);
      b.add(TextPost(
        username: userData["username"],
        profileImage: NetworkImage(userData["imgUrl"]),
        text: item,
        isMine: false,
        postId: k,
      ));
    });
    userPosts = b;
  }

  List<PostBase> getMyResults() {
    if (myselectedIndex.value == "posts") {
      return userPosts;
    } else if (myselectedIndex.value == "medias") {
      return userMedias;
    } else {
      return myLocations;
    }
  }

  String getIsRemoveOrAdd() {
    thirdUserId.value = userId;
    myFirestore
        .isFollowing(myAuth.getCurrentUser(), thirdUserId.value)
        .then((value) {
      friendShipStatus.value = value;
    });

    if (friendShipStatus.value) {
      return "Remove";
    } else {
      return "Add";
    }
  }

  void handleAddRemoveFriend() {
    if (friendShipStatus.value) {
      myFirestore.deleteFriendship(myAuth.getCurrentUser(), thirdUserId.value);
      friendShipStatus.value = false;
    } else {
      myFirestore.addFriendship(myAuth.getCurrentUser(), thirdUserId.value);
      friendShipStatus.value = true;
    }
  }

//   List<PostBase> userMedias = [
//     ImagePost(
//       username: "Gulce",
//       image: NetworkImage(
//         "https://randomuser.me/api/portraits/women/4.jpg",
//       ),
//       profileImage: NetworkImage(
//         "https://randomuser.me/api/portraits/women/3.jpg",
//       ),
//     ),
//     ImagePost(
//       username: "Gulce",
//       image: NetworkImage(
//         "https://randomuser.me/api/portraits/women/4.jpg",
//       ),
//       profileImage: NetworkImage(
//         "https://randomuser.me/api/portraits/women/3.jpg",
//       ),
//     ),
//     ImagePost(
//       username: "Gulce",
//       image: NetworkImage(
//         "https://randomuser.me/api/portraits/women/4.jpg",
//       ),
//       profileImage: NetworkImage(
//         "https://randomuser.me/api/portraits/women/3.jpg",
//       ),
//     ),
//   ].obs;

//   List<PostBase> userPosts = [
//     TextPost(
//       username: "Gulce",
//       profileImage: NetworkImage(
//         "https://randomuser.me/api/portraits/women/4.jpg",
//       ),
//       text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
//     ),
//     TextPost(
//       username: "Gulce",
//       profileImage: NetworkImage(
//         "https://randomuser.me/api/portraits/women/4.jpg",
//       ),
//       text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
//     ),
//     TextPost(
//       username: "Gulce",
//       profileImage: NetworkImage(
//         "https://randomuser.me/api/portraits/women/4.jpg",
//       ),
//       text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
//     ),
//   ].obs;

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
