import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAuth extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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

  Future<void> googleSignin() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    try {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        User user = userCredential.user;
        print("NAMEEE" + user.displayName);
        print("USEEEER" + user.toString());

        Get.snackbar(
          "signin succesfull",
          "you will be directed to the main page in a second",
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: Duration(seconds: 2),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );

        myFirestore.signupDetailsGoogle(
            user.displayName, user.email, auth.currentUser.uid);
        await Future.delayed(Duration(seconds: 3));

        Get.offAllNamed("/mainapp");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          print("account-exists-with-different-credential");
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          print("invalid-credential");
        }
      } catch (e) {
        // handle the error here
        print(e.toString());
      }
    } catch (e) {
      print("We are in first catch");
      print(e.toString());
    }
  }
}
