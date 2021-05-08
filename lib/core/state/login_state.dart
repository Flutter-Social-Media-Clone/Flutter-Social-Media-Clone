import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState extends GetxController {
  final formKey = GlobalKey<FormState>();
  var email = "".obs;
  var pass = "".obs;

  void handleLogin() async {
    if (formKey.currentState.validate()) {
      print("Handle login tapped!");
      formKey.currentState.save();
      print(email);
      print(pass);
      Get.offAllNamed("/mainapp");
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
