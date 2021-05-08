import 'package:cs310insta/core/models/KFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String email;

  void handlePassword() async {
    if (formKey.currentState.validate()) {
      print("Handle password tapped!");
      formKey.currentState.save();
      print(email);
    }
  }

  void handleSaveEmail(String value) {
    email = value;
  }
  
  KFormField emailField = new KFormField(
    keyboardType: TextInputType.emailAddress,
    hint: "email",
  );


  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
