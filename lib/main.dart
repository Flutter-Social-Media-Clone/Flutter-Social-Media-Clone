import 'package:cs310insta/ui/counter_screen/counter_screen.dart';
import 'package:cs310insta/ui/login_screen/login_screen.dart';
import 'package:cs310insta/ui/signup_screen/signup_screen.dart';
import 'package:cs310insta/ui/walkthrough_screen/walkthrough_screen.dart';
import 'package:cs310insta/ui/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool('seen') ?? false;
    print("TRIAL ${_seen}");
    if (_seen) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print("SNAP ${snapshot.data}");
            return MaterialApp(
              initialRoute: snapshot.data ? "/" : "/walkthrough",
              routes: {
                "/": (context) => WelcomeScreen(),
                "/walkthrough": (context) => WalkthroughScreen(),
                "/login": (context) => LoginScreen(),
                "/signup": (context) => SignupScreen(),
              },
            );
          }
        });
  }
}
