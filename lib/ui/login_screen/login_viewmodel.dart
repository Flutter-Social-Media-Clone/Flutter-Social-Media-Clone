import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  // <-- extends ChangeNotifier

  final formKey = GlobalKey<FormState>();
  String email;
  String pass;

  void handleLogin(context) async {
    if (formKey.currentState.validate()) {
      print("Handle login tapped!");
      formKey.currentState.save();
      print(email);
      print(pass);
      Navigator.pushNamed(context, "/notification");
    }
  }

  void handleSaveEmail(value) {
    email = value;
  }

  void handleSavePass(value) {
    pass = value;
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

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
