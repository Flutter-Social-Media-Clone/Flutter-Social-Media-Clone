import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String email;
  String username;
  int age;
  String gender;
  String pass;
  String pass2;

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
    }
  }

  void handleSaveEmail(String value) {
    email = value;
  }

  void handleSavePass(String value) {
    pass = value;
  }

  void handleSavePass2(String value) {
    pass2 = value;
  }

  void handleSaveUsername(String value) {
    username = value;
  }

  void handleSaveAge(String value) {
    age = int.parse(value);
  }

  void handleSaveGender(String value) {
    gender = value;
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

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
