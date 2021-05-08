import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String oldpass;
  String newpass;
  String newpass2;
  List<String> genderList = ['Male', 'Female', 'Other'];

  void handlePassword() async {
    if (formKey.currentState.validate()) {
      print("Handle password tapped!");
      formKey.currentState.save();
      print(oldpass);
      print(newpass);
      print(newpass2);
    }
  }

  void handleSavePass(String value) {
    oldpass = value;
  }

  void handleSaveNewPass(String value) {
    newpass = value;
  }

  void handleSaveNewPass2(String value) {
    newpass2 = value;
  }

  
  KFormField passwordField = new KFormField(
    keyboardType: TextInputType.text,
    hint: "Current password",
    obscureText: true,
    autocorrect: false,
    enableSuggestions: false,
  );

  KFormField newpasswordField = new KFormField(
    keyboardType: TextInputType.text,
    hint: "New password",
    obscureText: true,
    autocorrect: false,
    enableSuggestions: false,
  );

  KFormField newpassword2Field = new KFormField(
    keyboardType: TextInputType.text,
    hint: "Confirm Password",
    obscureText: true,
    autocorrect: false,
    enableSuggestions: false,
  );



  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
