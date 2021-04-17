import 'package:cs310insta/ui/counter_screen/counter_screen.dart';
import 'package:cs310insta/ui/edit_profile_screen/edit_profile_screen.dart';
import 'package:cs310insta/ui/hidden_screen/hidden_screen.dart';
import 'package:cs310insta/ui/login_screen/login_screen.dart';
import 'package:cs310insta/ui/main_app_screen/main_app_screen.dart';
import 'package:cs310insta/ui/signup_screen/signup_screen.dart';
import 'package:cs310insta/ui/third_person_profile_screen/third_person_profile_screen.dart';
import 'package:cs310insta/ui/walkthrough_screen/walkthrough_screen.dart';
import 'package:cs310insta/ui/welcome_screen/welcome_screen.dart';
import 'package:cs310insta/ui/notification_screen/notification_screen.dart';
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
            initialRoute:
                "/mainapp", //snapshot.data ? "/welcome" : "/walkthrough",
            routes: {
              "/walkthrough": (context) => WalkthroughScreen(),
              "/welcome": (context) => WelcomeScreen(),
              "/login": (context) => LoginScreen(),
              "/signup": (context) => SignupScreen(),
              "/notification": (context) => NotificationScreen(),
              "/mainapp": (context) => MainAppScreen(),
              "/thirdPersonProfile": (context) => ThirdPersonProfileScreen(),
              "/hiddenProfile": (context) => HiddenProfile(),
              "/editProfile": (context) => EditProfilePage(),
            },
          );
        }
      },
    );
  }
}
