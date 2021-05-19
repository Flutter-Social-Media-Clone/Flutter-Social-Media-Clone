import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/auth.dart';
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

  void bookmarkDetails(String username, String imgUrl) {
    firestoreInstance.collection("username").doc(username).set({
      "username": username,
      "imgUrl": imgUrl, // TODO remove this 
      
    }).then((_) {
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
