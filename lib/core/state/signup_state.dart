import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/KFormField.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupState extends GetxController {
  final formKey = GlobalKey<FormState>();

  final MyAuth myAuth = Get.put(MyAuth());

  var email = "".obs;
  var username = "".obs;
  var age = 0.obs;
  var gender = "".obs;
  var pass = "".obs;
  var pass2 = "".obs;

  List<String> genderList = ['Male', 'Female', 'Other'];

  void handleSignup() async {
    if (formKey.currentState.validate()) {
      print("Handle signup tapped!");
      formKey.currentState.save();
      print(email);
      print(username);
      print(age);
      print(gender);
      print(pass);
      print(pass2);

      myAuth.signup(
          email.value, pass.value, username.value, age.value, gender.value);
      addImage2Storage(_image.value, username.value);
    }
  }

  void handleSaveEmail(var value) {
    email.value = value;
  }

  void handleSavePass(var value) {
    pass.value = value;
  }

  void handleSavePass2(var value) {
    pass2.value = value;
  }

  void handleSaveUsername(var value) {
    username.value = value;
  }

  void handleSaveAge(var value) {
    age.value = int.parse(value);
  }

  void handleSaveGender(var value) {
    gender.value = value;
  }

  void setGender(var value) {
    print("MY VALUE  ${value}");
    gender.value = value;
    print("MY VALUE 2 ${gender.value}");
  }

  KFormField emailField = new KFormField(
    keyboardType: TextInputType.emailAddress,
    hint: "email",
  );

  KFormField ageField = new KFormField(
    keyboardType: TextInputType.number,
    hint: "age",
  );

  KFormField usernameField = new KFormField(
    keyboardType: TextInputType.text,
    hint: "username",
  );

  KFormField genderField = new KFormField(
    keyboardType: TextInputType.text,
    hint: "gender",
  );

  KFormField passwordField = new KFormField(
    keyboardType: TextInputType.text,
    hint: "password",
    obscureText: true,
    autocorrect: false,
    enableSuggestions: false,
  );

  KFormField password2Field = new KFormField(
    keyboardType: TextInputType.text,
    hint: "password check",
    obscureText: true,
    autocorrect: false,
    enableSuggestions: false,
  );

  var storage = FirebaseStorage.instance;
  var myShareIndex = "media".obs;
  File _imageFile;
  void setShareIndex(var index) {
    myShareIndex.value = index;
  }

  var _image = PickedFile("").obs;

  File getImage() {
    if (_image.value.path != "") {
      return File(_image.value.path);
    } else {
      return null;
    }
  }

  final _picker = ImagePicker();

  void imgFromCamera(context) async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    _image.value = image;
    //addImage2Storage(image);
    Navigator.pop(context);
  }

  void imgFromGallery(context) async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    _image.value = image;
    print("asdsad");
    print(image.path);
    //addImage2Storage(image);
    Navigator.pop(context);
  }

  void removeImage() {
    _image.value = PickedFile("");
  }

  void addImage2Storage(PickedFile image, String username) async {
    _imageFile = File(image.path);
    final byteData = await rootBundle.load(image.path);
    await _imageFile.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    TaskSnapshot snapshot = await storage
        .ref()
        .child("profilePhotos/${username}.jpg")
        .putFile(_imageFile);
    if (snapshot.state == TaskState.success) {
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection("profilePhotos")
          .add({"url": downloadUrl, "name": "${username}.jpg"});
    }
  }
}
