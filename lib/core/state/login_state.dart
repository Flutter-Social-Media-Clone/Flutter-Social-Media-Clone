import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState extends GetxController {
  final formKey = GlobalKey<FormState>();
  var email = "".obs;
  var pass = "".obs;

  final MyAuth myAuth = Get.put(MyAuth());

  void handleLogin() async {
    if (formKey.currentState.validate()) {
      print("Handle login tapped!");
      formKey.currentState.save();
      print(email);
      print(pass);
      myAuth.login(email.value, pass.value);
      //myAuth.googleSignin();
    }
  }

  void handleSaveEmail(var value) {
    email.value = value;
  }

  void handleSavePass(var value) {
    pass.value = value;
  }

  KFormField emailField = new KFormField(
    keyboardType: TextInputType.emailAddress,
    hint: "email",
  );

  KFormField passwordField = new KFormField(
    keyboardType: TextInputType.text,
    hint: "password",
    obscureText: true,
    autocorrect: false,
    enableSuggestions: false,
  );
}
