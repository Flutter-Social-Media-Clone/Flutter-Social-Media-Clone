import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/cardModel.dart';
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

  void getbookmarked(String username, String bookmarked, String uid) {
    firestoreInstance.collection("bookmarks").doc(uid).set({
      "username": username, //current user
      "bookmarked": bookmarked, //bookmarked person
    }).then((_) {
      print("bookmarked!");
    });
  }

  void deleteLike(String username, String liked) async {
    await firestoreInstance
        .collection("Liked")
        .where("username", isEqualTo: username)
        .where("liked", isEqualTo: liked)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("DELETEEE CALLEED FOR ELEMENT ID ${element.id}");
        firestoreInstance
            .collection("Liked")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Deleted!");
        });
      });
    });
  }

  void deleteBookmark(String bookmarked, String username) async {
    await firestoreInstance
        .collection("bookmarks")
        .where("username", isEqualTo: username)
        .where("bookmarked", isEqualTo: bookmarked)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("DELETEEE CALLEED FOR ELEMENT ID ${element.id}");
        firestoreInstance
            .collection("bookmarks")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Deleted bookmark!");
        });
      });
    });
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    var data = await firestoreInstance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {
      // print(value.data());
      // print("DATAAAAAA");
      return value.data();
    });

    return data;
  }

  Future<String> getUserName(String uid) async {
    var userData = {};
    userData = await getUser(uid);
    var a = await getUser(uid);
    print(userData["username"]);
    return userData["username"];
  }

  Future<Map<String, dynamic>> getMyMedias(String uid) async {
    print("getMyMedias starts");
    var data = FirebaseFirestore.instance
        .collection('post')
        .where("creator_uid", isEqualTo: uid)
        .where("type", isEqualTo: "image")
        .orderBy("createdAt", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      // List<String> posts = [];
      Map<String, dynamic> posts = {};

      querySnapshot.docs.forEach((doc) {
        // print("--------->>>" + doc["imgUrl"]);
        // print("--------->>>" + doc.id);
        // print("\n\n\n\n\n\n.");

        posts[doc.id.toString()] = doc["imgUrl"];
        // posts.add(
        //   doc["imgUrl"],
        //   doc.id
        // );
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
    var toUsername = await getUserName(toUid);
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
      "lastSenderUsername": fromUsername,
      "username": toUsername,
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
      "lastSenderUsername": toUsername,
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
    var toUsername = await getUserName(fromUid);

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
      "lastSenderUsername": fromUsername,
      "username": toUsername,
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
    var fromUsername = await getUserName(fromUid);

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
      "lastSenderUsername": fromUsername,
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

  Future addNotification(String uid, String text) async {
    print("${uid}ye gönderildi");
    await firestoreInstance.collection("notifications").add({
      "imgUrl": "dummy2",
      "userId": uid,
      "timestamp": DateTime.now(),
      "notificationText": text
    }).then((res) {
      print("success");
    });
  }

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

  Future<Map<String, dynamic>> getNotifications(String suid) async {
    print("getNotifications starts");
    var data = FirebaseFirestore.instance
        .collection("notifications")
        .where("userId", isEqualTo: suid)
        //.where("type", isEqualTo: "post")
        .orderBy("timestamp", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print("anan");
      Map<String, dynamic> posts = {};
      print("\n\n\n\n\n\n---->>");
      print("---->>" + querySnapshot.docs.toString());
      print("\n\n\n\n\n\n-");

      querySnapshot.docs.forEach((doc) {
        print("\n\n\n\n\n\n---->>" + doc["imgUrl"]);
        print("---->>" + doc["notificationText"]);
        print("\n\n\n\n\n\n-");
        // print(doc.id.toString() + "<<---");

        posts[doc.id.toString()] = NotificationModel(
          id: 1,
          image_url: doc["imgUrl"],
          notification: doc["notificationText"],
          timestamp: doc["timestamp"],
        );

        // posts.add(
        //   doc["text"],
        // );
      });

      return posts;
    });

    return data;

    //return result;
  }

  void deletePost(String postId) {
    print("post ${postId} will be deleted");
    firestoreInstance.collection("post").doc(postId).delete().then((_) {
      print("success");
    });
  }

  void addFriendship(String from, String to) async {
    firestoreInstance.collection("friends").add({
      "from": from,
      "to": to,
    }).then((_) {
      print("success friend added");
    });
    var a = await getUserName(to);
    addNotification(to, "${from} added you as friend.");
    addNotification(from, "You added ${a} as friend.");
  }

  void getLiked(String username, String liked, String uid) async {
    firestoreInstance.collection("Liked").doc(uid).set({
      "username": username, //current user
      "liked": liked, //liked person
    }).then((_) {
      print("Liked!");
    });
    addNotification(username, "likeee attım ben");
    addNotification(liked, "likeee attım ben");
  }

  void deleteFriendship(String from, String to) async {
    await firestoreInstance
        .collection("friends")
        .where("from", isEqualTo: from)
        .where("to", isEqualTo: to)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("DELETEEE CALLEED FOR ELEMENT ID ${element.id}");
        firestoreInstance
            .collection("friends")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  Future<List<Map>> getFollowers(String to) async {
    var data = await firestoreInstance
        .collection("friends")
        .where("to", isEqualTo: to)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var list = [];
      querySnapshot.docs.forEach((doc) {
        list.add(doc["from"]);
      });
      return list;
    });
    print("FOLLOWERSSSSS $data");

    List<Map> mapOfFollowers = [];

    await Future.forEach(data, (item) async {
      var userData = await FirebaseFirestore.instance
          .collection("users")
          .doc(item)
          .get()
          .then((value) {
        return value.data();
      });

      mapOfFollowers.add({
        "userId": item,
        "username": userData["username"],
        "imgUrl": userData["imgUrl"],
      });
    });
    print("FOLLOWERSSSSS 22222222 $mapOfFollowers");
    return mapOfFollowers;
  }

  Future<List<Map>> getFollowing(String from) async {
    var data = await firestoreInstance
        .collection("friends")
        .where("from", isEqualTo: from)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var list = [];
      querySnapshot.docs.forEach((doc) {
        list.add(doc["to"]);
      });
      return list;
    });
    print("FOLLOWIINNGGGGG $data");

    List<Map> mapOfFollowing = [];

    await Future.forEach(data, (item) async {
      var userData = await FirebaseFirestore.instance
          .collection("users")
          .doc(item)
          .get()
          .then((value) {
        return value.data();
      });

      mapOfFollowing.add({
        "userId": item,
        "username": userData["username"],
        "imgUrl": userData["imgUrl"],
      });
    });

    print("FOLLOWIINNGGGGG 22222 $mapOfFollowing");

    return mapOfFollowing;
  }

  Future<bool> isFollowing(String firstPerson, String thirdPerson) async {
    var isFriend = await firestoreInstance
        .collection("friends")
        .where("from", isEqualTo: firstPerson)
        .where("to", isEqualTo: thirdPerson)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var count = 0;
      querySnapshot.docs.forEach((doc) {
        count += 1;
      });
      print("COUNTTTTTT $count");
      return count;
    });

    return (isFriend == 0 ? false : true);
  }

  Future<List<Map>> getFeed(String uid) async {
    List<Map> following = await getFollowing(uid);

    List<Map> posts = [];
    await Future.forEach(following, (item) async {
      var postData = await FirebaseFirestore.instance
          .collection("post")
          .where("creator_uid", isEqualTo: item["userId"])
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          var postContent;
          if (doc["type"] == "image") {
            postContent = doc["imgUrl"];
          } else if (doc["type"] == "post") {
            postContent = doc["text"];
          }
          posts.add({
            "creator_uid": doc["creator_uid"],
            "postId": doc.id,
            "type": doc["type"],
            "postContent": postContent,
            "username": item["username"],
            "profileImg": item["imgUrl"],
          });
        });
      });
    });

    print("FEEEDD DAATTAAAAAAA\n\n\n$posts");
    return posts;
  }

  // following de uid al
  // uid ile post
  // uid ile text
  // mergele ?

}

// Future<List<Map>> getTopicForSearch(String queryText) async {
//   if (queryText == "as") {
//     print("getTopicForSearch as stops");

//     return List<Map>();
//   }
//   List<Map> topicPosts = [];
//   await FirebaseFirestore.instance
//       .collection('post')
//       .where("topic", arrayContains: queryText)
//       .orderBy("createdAt", descending: true)
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) {

//       //print("NEWLY USER DATAAAAAAAA TOPIC $userData");
//       var postContent;
//       if (doc["type"] == "image") {
//         postContent = doc["imgUrl"];
//       } else if (doc["type"] == "post") {
//         postContent = doc["text"];
//       }
//       topicPosts.add({
//         "creator_uid": doc["creator_uid"],
//         "postId": doc.id,
//         "type": doc["type"],
//         "postContent": postContent,
//       });
//     });
//   });

//   List<Map> newTopicPosts = [];

//   await Future.forEach(topicPosts, (item) async {
//     var userData = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(item["creator_uid"])
//         .get()
//         .then((value) {

//       return value.data();
//     });

//     newTopicPosts.add({
//       "postId": item["postId"],
//       "type": item["type"],
//       "postContent": item["postContent"],
//       "username": userData["username"],
//       "profileImg": userData["imgUrl"],
//     });
//   });

//   return newTopicPosts;
//   //return result;
// }
