import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:get/get.dart';

class MyFirestore extends GetxController {
  final firestoreInstance = FirebaseFirestore.instance;

  void signupDetails(
      String username, String email, int age, String gender, String uid) {
    firestoreInstance.collection("users").doc(uid).set({
      "username": username,
      "age": age,
      "email": email,
      "gender": gender
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
}
