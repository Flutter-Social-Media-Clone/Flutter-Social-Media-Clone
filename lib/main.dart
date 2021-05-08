import 'package:cs310insta/ui/comments_screen/comments_screen.dart';

import 'package:cs310insta/ui/c_password_screen/change_password_screen.dart';
import 'package:cs310insta/ui/edit_profile_screen/edit_profile_screen.dart';
import 'package:cs310insta/ui/f_password_screen/password_screen.dart';
import 'package:cs310insta/ui/hidden_screen/hidden_screen.dart';
import 'package:cs310insta/ui/login_screen/login_screen.dart';
import 'package:cs310insta/ui/main_app_screen/main_app_screen.dart';
import 'package:cs310insta/ui/selectTopics_screen/selectTopics_screen.dart';
import 'package:cs310insta/ui/signup_screen/signup_screen.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_screen.dart';
import 'package:cs310insta/ui/third_person_profile_screen/third_person_profile_screen.dart';
import 'package:cs310insta/ui/walkthrough_screen/walkthrough_screen.dart';
import 'package:cs310insta/ui/welcome_screen/welcome_screen.dart';
import 'package:cs310insta/ui/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs310insta/ui/components/messageDetail/message_detail.dart';
import 'package:cs310insta/ui/message_screen/message_screen.dart';

import 'core/models/subscription_bar.dart';

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
          return GetMaterialApp(
            initialRoute: snapshot.data ? "/mainapp" : "/walkthrough",
            // routes: {
            //   "/walkthrough": (context) => WalkthroughScreen(),
            //   "/welcome": (context) => WelcomeScreen(),
            //   "/login": (context) => LoginScreen(),
            //   "/signup": (context) => SignupScreen(),
            //   "/notification": (context) => NotificationScreen(),
            //   "/mainapp": (context) => MainAppScreen(),
            //   "/thirdPersonProfile": (context) => ThirdPersonProfileScreen(),
            //   "/hiddenProfile": (context) => HiddenProfile(),
            //   "/editProfile": (context) => EditProfilePage(),
            //   "/selectTopics": (context) => SelectTopics(),
            // },
            getPages: [
              GetPage(name: "/walkthrough", page: () => WalkthroughScreen()),
              GetPage(name: "/welcome", page: () => WelcomeScreen()),
              GetPage(name: "/login", page: () => LoginScreen()),
              GetPage(name: "/signup", page: () => SignupScreen()),
              GetPage(name: "/notification", page: () => NotificationScreen()),
              GetPage(name: "/mainapp", page: () => MainAppScreen()),
              GetPage(
                  name: "/thirdPersonProfile",
                  page: () => ThirdPersonProfileScreen()),
              GetPage(name: "/hiddenProfile", page: () => HiddenProfile()),
              GetPage(name: "/editProfile", page: () => EditProfilePage()),
              GetPage(name: "/selectTopics", page: () => SelectTopics()),
              GetPage(name: "/messageSingle", page: () => MessageDetail()),
              GetPage(name: "/message", page: () => MessagePage()),
              GetPage(name: "/comments", page: () => CommentsScreen()),
              GetPage(name: "/subscription", page: () => SubscriptionBar()),
              GetPage(name: "/password", page: () => ForgotPassword()),
              GetPage(name: "/changepassword", page: () => ChangePassword()),
            ],
          );
        }
      },
    );
  }
}

// void main() {
//   runApp(GetMaterialApp(
//     unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
//     initialRoute: '/',
//     getPages: [
//       GetPage(name: '/', page: () => MyHomePage()),
//       GetPage(name: '/second', page: () => Second()),
//     ],
//   ));
// }
