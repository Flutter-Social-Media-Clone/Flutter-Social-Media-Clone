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
      //print(querySnapshot.docs);
      querySnapshot.docs.forEach((doc) {
        // print("---->>" + doc["text"]);
        // print(doc.id.toString() + "<<---");
        posts[doc.id.toString()] = doc["text"];

        // posts.add(
        //   doc["text"],
        // );
      });

      return posts;
    });

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

      querySnapshot.docs.forEach((doc) {
        // print("---->>" + doc["text"]);
        // print(doc.id.toString() + "<<---");
        posts[doc.id.toString()] = doc["text"];

        // posts.add(
        //   doc["text"],
        // );
      });

      return posts;
    });

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
    print("\n\n\n\n\n Message is sending:");
    print("From:" + fromUsername + "--->> to:" + toUsername);
    print("FromUid:" + fromUid + "--->> toUid:" + toUid);
    print("FromImg:" + fromImgUrl + "--->> toImg:" + toImgUrl);
    print("Message is: " + text + "\n\n\n\n\n.");
    var docId = "";
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
      print("kkkk" + res.id);
      docId = res.id;
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
      "username": fromUsername,
      "timestamp": DateTime.now(),
      "docId": docId,
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
      docId = res.id;
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
      "docId": docId,
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
    String messageId,
  ) async {
    bool isRead = false;
    print("aloooo" + toUid + "///" + fromUid);

    print("\n\n\n\n\n Message is READING:");
    print("From:" + fromUsername + "--->> to:");
    print("FromUid:" + fromUid + "--->> toUid:");
    print("FromImg:" + fromImgUrl + "--->> toImg:");
    print("MessageID is: " + messageId + "\n\n\n\n\n.");

    // await firestoreInstance
    //     .collection("messages")
    //     .doc("${toUid}")
    //     .collection("friends")
    //     .doc("${fromUid}")
    //     .collection("messageList")
    //     .add({
    //   // .doc(messageId)
    //   // .set({
    //   "imgUrl": fromImgUrl,
    //   "isRead": false,
    //   "text": fromText,
    //   "timestamp": fromTimestamp,
    //   "username": fromUsername
    // }).then((res) {
    //   print("success");
    // });
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
      "username": fromUsername,
      "docId": messageId,
      //"timestamp": DateTime.now(),
    }).then((res) {
      print("success");
    });
  }

  Future createConv(
    String toUid,
    String fromUid,
    String toImgUrl,
    String toUsername,
  ) async {
    bool isRead = false;
    print("aloooo" + toUid + "///" + fromUid);

    await firestoreInstance
        .collection("messages")
        .doc("${fromUid}")
        .collection("friends")
        .doc("${toUid}")
        .set({
      "docId": "newMessage",
      "imgUrl": toImgUrl,
      "isRead": false,
      "lastMessage": "You attempt to start conversation but no message sent",
      "timestamp": DateTime.now(),
      "username": toUsername
    }).then((res) {
      print("success");
    });
    // await firestoreInstance
    //     .collection("messages")
    //     .doc("${fromUid}")
    //     .collection("friends")
    //     .doc("${toUid}")
    //     .collection("messageList")
    //     .add({
    //   "imgUrl": "dummy",
    //   "isRead": false,
    //   "lastMessage": "new",
    //   "timestamp": DateTime.now(),
    //   "username": toUsername
    // }).then((res) {
    //   print("success");
    // });
    // await firestoreInstance
    //     .collection("messages")
    //     .doc("${toUid}")
    //     .collection("friends")
    //     .doc("${fromUid}")
    //     .set({
    //   "imgUrl": fromImgUrl,
    //   "isRead": false,
    //   "lastMessage": fromText,
    //   "timestamp": fromTimestamp,
    //   "username": fromUsername
    //   //"timestamp": DateTime.now(),
    // }).then((res) {
    //   print("success");
    // });
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

  Future<List<Map>> getPeopleForSearch(String queryText) async {
    print("getPeopleForSearch starts");

    if (queryText == "") {
      return List<Map>();
    }
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where("isActive", isEqualTo: true)
        .where("username", isGreaterThanOrEqualTo: queryText)
        .where("username", isLessThanOrEqualTo: queryText + '\uf8ff')
        .orderBy("username")
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<Map> users = [];

      querySnapshot.docs.forEach((doc) {
        print(doc["username"]);
        print(doc["imgUrl"]);
        print("is ID HERE ???? ==> ${doc.id}");
        print("is DATA HERE ???? ==> ${doc.data()}");
        users.add({
          "userId": doc.id,
          "username": doc["username"],
          "imgUrl": doc["imgUrl"]
        });
      });

      return users;
    });

    return data;
    //return result;
  }

  Future<List<Map>> getTopicForSearch(String queryText) async {
    if (queryText == "as") {
      print("getTopicForSearch as stops");

      return List<Map>();
    }
    print("getTopicForSearch starts");
    List<Map> topicPosts = [];
    await FirebaseFirestore.instance
        .collection('post')
        .where("topic", arrayContains: queryText)
        .orderBy("createdAt", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print("IS IT EVEN COME TO TOPIC?????????????????????");
      querySnapshot.docs.forEach((doc) {
        print("TOPIICCCC ${(doc["creator_uid"])}");

        print(doc["type"]);
        print("is ID HERE TOPIC???? ==> ${doc.id}");
        print("is DATA HERE TOPIC ???? ==> ${doc.data()}");
        //print("NEWLY USER DATAAAAAAAA TOPIC $userData");
        var postContent;
        if (doc["type"] == "image") {
          postContent = doc["imgUrl"];
        } else if (doc["type"] == "post") {
          postContent = doc["text"];
        }
        print("postContent postContent postContent postContent $postContent");
        topicPosts.add({
          "creator_uid": doc["creator_uid"],
          "postId": doc.id,
          "type": doc["type"],
          "postContent": postContent,
          // "username": "demo1000",
          // "profileImg":
          //     "https://www.booksie.com/files/profiles/22/mr-anonymous.png",
          //"username": userData["username"],
          //"profileImg": userData["imgUrl"],
        });
      });
      print("topicPosts topicPosts topicPosts topicPosts $topicPosts");
    });

    print("DATA DATA DATA DATA $topicPosts");
    List<Map> newTopicPosts = [];
    await Future.forEach(topicPosts, (item) async {
      var userData = await FirebaseFirestore.instance
          .collection("users")
          .doc(item["creator_uid"])
          .get()
          .then((value) {
        print(value.data());
        print("DATAAAAAA TOPIIC");
        return value.data();
      });

      print("NEWLY USER DATAAAAAAAA TOPIC $userData");
      newTopicPosts.add({
        "postId": item["postId"],
        "type": item["type"],
        "postContent": item["postContent"],
        "username": userData["username"],
        "profileImg": userData["imgUrl"],
      });
    });

    print("BİZİM BİZİM BİZİM BİZİM $newTopicPosts");
    return newTopicPosts;
    //return result;
  }
}
