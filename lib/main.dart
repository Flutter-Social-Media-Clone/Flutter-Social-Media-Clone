import 'package:cs310insta/ui/counter_screen/counter_screen.dart';
import 'package:cs310insta/ui/login_screen/login_screen.dart';
import 'package:cs310insta/ui/signup_screen/signup_screen.dart';
import 'package:cs310insta/ui/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => WelcomeScreen(),
        //"/walkthrough": (context) => ProfileView(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignupScreen(),
      },
    );
  }
}
