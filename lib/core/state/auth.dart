import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class MyAuth extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final MyFirestore myFirestore = Get.put(MyFirestore());

  Future<void> signup(String email, String password, String username, int age,
      String gender, PickedFile _image) async {
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

      var storage = FirebaseStorage.instance;
      String downloadUrl =
          "https://www.booksie.com/files/profiles/22/mr-anonymous.png";
      print(_image.path == "");
      if (_image.path != "") {
        print(_image.path == "");
        print("girrdi");
        File _imageFile;
        _imageFile = File(_image.path);

        final byteData = await rootBundle.load(_image.path);
        await _imageFile.writeAsBytes(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
        TaskSnapshot snapshot = await storage
            .ref()
            .child("profilePhotos/${username}.jpg")
            .putFile(_imageFile);
        if (snapshot.state == TaskState.success) {
          downloadUrl = await snapshot.ref.getDownloadURL();
          await FirebaseFirestore.instance
              .collection("profilePhotos")
              .add({"url": downloadUrl, "name": "${username}.jpg"});
        }
      }

      myFirestore.signupDetails(
          username, email, age, gender, downloadUrl, auth.currentUser.uid);

      await Future.delayed(Duration(seconds: 3));
      Get.offNamed("/login");
      print(userCredentials.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Weak Password",
          "try harder password",
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: Duration(seconds: 2),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Email Exists",
          "Use Different Email",
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: Duration(seconds: 2),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );

        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> editProfile(
      String username, int age, String gender, PickedFile _image) async {
    try {
      var storage = FirebaseStorage.instance;
      String downloadUrl =
          "https://www.booksie.com/files/profiles/22/mr-anonymous.png";
      File _imageFile;
      _imageFile = File(_image.path);
      final byteData = await rootBundle.load(_image.path);
      await _imageFile.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      TaskSnapshot snapshot = await storage
          .ref()
          .child("profilePhotos/${username}.jpg")
          .putFile(_imageFile);
      if (snapshot.state == TaskState.success) {
        downloadUrl = await snapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("profilePhotos")
            .add({"url": downloadUrl, "name": "${username}.jpg"});
      }

      myFirestore.editDetails(
          username, age, gender, downloadUrl, auth.currentUser.uid);

      await Future.delayed(Duration(seconds: 3));
      Get.offNamed("/login");
      //print(userCredentials.toString());
    } on FirebaseAuthException catch (e) {
      print("Error" + e.toString());
    }
  }

  Future<void> login(email, password) async {
    try {
      UserCredential userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredentials.toString());

      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user.uid)
          .get()
          .then((data) => {
                // varsa account
                if (data["isActive"] == false)
                  {
                    firestoreInstance
                        .collection("users")
                        .doc(userCredentials.user.uid)
                        .update({
                      "isActive": true,
                    }).then((_) {
                      print("success");
                    })
                  }
              });
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
      // print(" CURRENT USER " + user.uid);
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
        print("PhotoURL" + user.photoURL);

        Get.snackbar(
          "signin succesfull",
          "you will be directed to the main page in a second",
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: Duration(seconds: 2),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((data) => {
                  if (!data.exists)
                    {
                      //sıfırdan yaratma
                      myFirestore.signupDetailsGoogle(user.displayName,
                          user.email, user.photoURL, auth.currentUser.uid)
                    }
                  else
                    {
                      // varsa account
                      if (data["isActive"] == false)
                        {
                          firestoreInstance
                              .collection("users")
                              .doc(user.uid)
                              .update({
                            "isActive": true,
                          }).then((_) {
                            print("success");
                          })
                        }
                    }
                });

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
