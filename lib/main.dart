import 'package:cs310insta/ui/counter_screen/counter_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => CounterScreen(),
        // "/profile": (context) => ProfileView(),
        // "/login": (context) => LoginView(),
        // "/signup": (context) => SignupView(),
      },
    );
  }
}
