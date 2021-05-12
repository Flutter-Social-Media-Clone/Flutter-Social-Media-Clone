import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAuth extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  final MyFirestore myFirestore = Get.put(MyFirestore());

  Future<void> signup(String email, String password, String username, int age,
      String gender) async {
    try {
      UserCredential userCredentials = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "signup succesfull",
        "you will be directed to the login page in a second",
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 2),
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );

      myFirestore.signupDetails(
          username, email, age, gender, auth.currentUser.uid);

      await Future.delayed(Duration(seconds: 3));
      Get.offNamed("/login");
      print(userCredentials.toString());
    } on FirebaseAuthException catch (e) {
      print("Error" + e.toString());
    }
  }

  Future<void> login(email, password) async {
    try {
      UserCredential userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredentials.toString());
      Get.snackbar(
        "login succesfull",
        "you will be directed to the app in a second",
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 2),
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );

      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed("/mainapp");
    } on FirebaseAuthException catch (e) {
      print("Error" + e.toString());
    }
  }

  String getCurrentUser() {
    try {
      var user = auth.currentUser;
      print(" CURRENT USER " + user.uid);
      return user.uid;
    } catch (e) {
      return "yok";
    }
  }
}
