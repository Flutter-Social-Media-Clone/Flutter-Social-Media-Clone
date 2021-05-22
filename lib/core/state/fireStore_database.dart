import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFirestore extends GetxController {
  final firestoreInstance = FirebaseFirestore.instance;

  void signupDetails(String username, String email, int age, String gender,
      String imgUrl, String uid) {
    firestoreInstance.collection("users").doc(uid).set({
      "username": username,
      "age": age,
      "email": email,
      "gender": gender,
      "imgUrl": imgUrl,
      "isActive": true,
    }).then((_) {
      print("success");
    });
  }

  void editDetails(
      String username, int age, String gender, String imgUrl, String uid) {
    firestoreInstance.collection("users").doc(uid).update({
      "username": username,
      "age": age,
      "gender": gender,
      "imgUrl": imgUrl,
    }).then((_) {
      print("success");
    });
  }

  void signupDetailsGoogle(
      String username, String email, String photoURL, String uid) {
    firestoreInstance.collection("users").doc(uid).set({
      "username": email,
      "email": email,
      "imgUrl": photoURL,
      "isActive": true,
    }).then((_) {
      print("success");
    });
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    var data = await firestoreInstance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {
      print(value.data());
      print("DATAAAAAA");
      return value.data();
    });

    return data;
  }

  Future<List<String>> getMyMedias(String uid) async {
    print("getMyMedias starts");
    var data = FirebaseFirestore.instance
        .collection('post')
        .where("creator_uid", isEqualTo: uid)
        .where("type", isEqualTo: "image")
        .orderBy("createdAt", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<String> posts = [];

      querySnapshot.docs.forEach((doc) {
        print(doc["imgUrl"]);

        posts.add(
          doc["imgUrl"],
        );
      });

      return posts;
    });

    return data;
    //return result;
  }

  Future<Map<String, dynamic>> getMyTextPosts(String uid) async {
    print("getMyTextPosts starts");
    var data = FirebaseFirestore.instance
        .collection('post')
        .where("creator_uid", isEqualTo: uid)
        .where("type", isEqualTo: "post")
        .orderBy("createdAt", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      Map<String, dynamic> posts = {};
      print(querySnapshot.docs);
      querySnapshot.docs.forEach((doc) {
        print("---->>" + doc["text"]);
        print(doc.id.toString() + "<<---");
        posts[doc.id.toString()] = doc["text"];

        // posts.add(
        //   doc["text"],
        // );
      });
      print("--HEYY-->>" + posts.toString());
      return posts;
    });
    print("AAAANNAANN" + data.toString());
    return data;
  }

  Future<Map<String, dynamic>> getMyMessages(String uid) async {
    print("getMyTextPosts starts");
    var data = FirebaseFirestore.instance
        .collection('messages')
        // .where("creator_uid", isEqualTo: uid)
        // .where("type", isEqualTo: "post")
        // .orderBy("createdAt", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      Map<String, dynamic> posts = {};
      print(querySnapshot.docs);
      querySnapshot.docs.forEach((doc) {
        print("---->>" + doc["text"]);
        print(doc.id.toString() + "<<---");
        posts[doc.id.toString()] = doc["text"];

        // posts.add(
        //   doc["text"],
        // );
      });
      print("--HEYY-->>" + posts.toString());
      return posts;
    });
    print("AAAANNAANN" + data.toString());
    return data;
  }

  Future sharePost(String text, List<String> topics, String uid) async {
    await firestoreInstance.collection("post").add({
      "creator_uid": uid,
      "type": "post",
      "topic": topics,
      "text": text,
      "createdAt": DateTime.now(),
    }).then((res) {
      print(res.id);
      print("success");
    });
  }

  Future shareImagePost(String imgUrl, List<String> topics, String uid) async {
    await firestoreInstance.collection("post").add({
      "creator_uid": uid,
      "type": "image",
      "topic": topics,
      "imgUrl": imgUrl,
      "createdAt": DateTime.now(),
    }).then((res) {
      print(res.id);
      print("success");
    });
  }

  Future sendMessage(
      String toUid,
      String fromUid,
      bool isRead,
      String text,
      String toUsername,
      String fromUsername,
      String toImgUrl,
      String fromImgUrl) async {
    // print("\n\n\n\n\n Message is sending:");
    // print("From:" + fromUsername + "--->> to:" + toUsername);
    // print("FromUid:" + fromUid + "--->> toUid:" + toUid);
    // print("FromImg:" + fromImgUrl + "--->> toImg:" + toImgUrl);
    // print("Message is: " + text + "\n\n\n\n\n.");

    await firestoreInstance
        .collection("messages")
        .doc("${fromUid}")
        .collection("friends")
        .doc("${toUid}")
        .collection("messageList")
        .add({
      "imgUrl": fromImgUrl,
      "isRead": false,
      "text": text,
      "username": fromUsername,
      "timestamp": DateTime.now(),
    }).then((res) {
      print(res);
      print("success");
    });
    await firestoreInstance
        .collection("messages")
        .doc("${fromUid}")
        .collection("friends")
        .doc("${toUid}")
        .set({
      "imgUrl": toImgUrl,
      "isRead": false,
      "lastMessage": text,
      "username": toUsername,
      "timestamp": DateTime.now(),
    }).then((res) {
      print("success");
    });

    await firestoreInstance
        .collection("messages")
        .doc("${toUid}")
        .collection("friends")
        .doc("${fromUid}")
        .collection("messageList")
        .add({
      "imgUrl": toImgUrl,
      "isRead": isRead,
      "text": text,
      "username": fromUsername,
      "timestamp": DateTime.now(),
    }).then((res) {
      print(res);
      print("success");
    });
    await firestoreInstance
        .collection("messages")
        .doc("${toUid}")
        .collection("friends")
        .doc("${fromUid}")
        .set({
      "imgUrl": fromImgUrl,
      "isRead": isRead,
      "lastMessage": text,
      "username": fromUsername,
      "timestamp": DateTime.now(),
    }).then((res) {
      print("success");
    });
  }

  Future changeReadStatus(
    String toUid,
    String fromUid,
    String fromImgUrl,
    String fromText,
    Timestamp fromTimestamp,
    String fromUsername,
  ) async {
    bool isRead = false;
    print("aloooo" + toUid + "///" + fromUid);

    await firestoreInstance
        .collection("messages")
        .doc("${toUid}")
        .collection("friends")
        .doc("${fromUid}")
        .collection("messageList")
        .add({
      "imgUrl": fromImgUrl,
      "isRead": false,
      "text": fromText,
      "timestamp": fromTimestamp,
      "username": fromUsername
    }).then((res) {
      print("success");
    });
    await firestoreInstance
        .collection("messages")
        .doc("${toUid}")
        .collection("friends")
        .doc("${fromUid}")
        .set({
      "imgUrl": fromImgUrl,
      "isRead": false,
      "lastMessage": fromText,
      "timestamp": fromTimestamp,
      "username": fromUsername
      //"timestamp": DateTime.now(),
    }).then((res) {
      print("success");
    });
  }
  // void shareMedia(
  //     String text, List<String> topics,String type, ) {
  //     firestoreInstance.collection("post").doc(uid).set({
  //     "type": type,
  //     "topic": topics,
  //     "createdAt": DateTime.now().millisecondsSinceEpoch,
  //   }).then((_) {
  //     print("success");
  //   });
  // }

}
