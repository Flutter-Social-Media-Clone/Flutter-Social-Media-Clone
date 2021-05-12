import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
