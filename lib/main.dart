import 'package:cs310insta/ui/comments_screen/comments_screen.dart';

import 'package:cs310insta/ui/c_password_screen/change_password_screen.dart';
import 'package:cs310insta/ui/delete_account_screen/delete_account_screen.dart';
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
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs310insta/ui/components/messageDetail/message_detail.dart';
import 'package:cs310insta/ui/message_screen/message_screen.dart';

import 'core/models/subscription_bar.dart';
import 'core/state/analytics.dart';
import 'core/state/auth.dart';
import 'ui/deactivate_screen/deactivate_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;
  bool _isSeen = false;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool('seen') ?? false;
    print("TRIAL ${_seen}");
    if (_seen) {
      setState(() {
        _isSeen = true;
      });
    } else {
      setState(() {
        _isSeen = false;
      });
    }
  }

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      print("error" + e.toString());
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    checkFirstSeen();

    super.initState();
  }

  final MyAnalytics myAnalytics = Get.put(MyAnalytics());

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('error'),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('loading...'),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
    }

    return GetMaterialApp(
      initialRoute: _isSeen ? "/mainapp" : "/walkthrough",
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
            name: "/thirdPersonProfile/:userId",
            page: () => ThirdPersonProfileScreen()),
        GetPage(name: "/hiddenProfile/:userId", page: () => HiddenProfile()),
        GetPage(name: "/editProfile", page: () => EditProfilePage()),
        GetPage(name: "/selectTopics", page: () => SelectTopics()),
        GetPage(name: "/messageSingle", page: () => MessageDetail()),
        GetPage(name: "/message", page: () => MessagePage()),
        GetPage(name: "/comments", page: () => CommentsScreen()),
        GetPage(name: "/subscription", page: () => SubscriptionBar()),
        GetPage(name: "/password", page: () => ForgotPassword()),
        GetPage(name: "/changepassword", page: () => ChangePassword()),
        GetPage(name: "/deleteAccount", page: () => DeleteAccountScreen()),
        GetPage(
            name: "/deactivateAccount", page: () => DeactivateAccountScreen()),
      ],
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: myAnalytics.analytics),
      ],
    );
  }
  // if (snapshot.hasError) {
  //   print("HAS ERROR" +
  //       snapshot.hasError.toString() +
  //       snapshot.error.toString());
  //   //if (snapshot.connectionState == ConnectionState.waiting) {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
  // if (snapshot.connectionState == ConnectionState.done) {
  //   //else {
  //   //print("SNAP ${snapshot.data}");
  //   return GetMaterialApp(
  //     initialRoute: snapshot.data ? "/mainapp" : "/walkthrough",
  //     // routes: {
  //     //   "/walkthrough": (context) => WalkthroughScreen(),
  //     //   "/welcome": (context) => WelcomeScreen(),
  //     //   "/login": (context) => LoginScreen(),
  //     //   "/signup": (context) => SignupScreen(),
  //     //   "/notification": (context) => NotificationScreen(),
  //     //   "/mainapp": (context) => MainAppScreen(),
  //     //   "/thirdPersonProfile": (context) => ThirdPersonProfileScreen(),
  //     //   "/hiddenProfile": (context) => HiddenProfile(),
  //     //   "/editProfile": (context) => EditProfilePage(),
  //     //   "/selectTopics": (context) => SelectTopics(),
  //     // },
  //     getPages: [
  //       GetPage(name: "/walkthrough", page: () => WalkthroughScreen()),
  //       GetPage(name: "/welcome", page: () => WelcomeScreen()),
  //       GetPage(name: "/login", page: () => LoginScreen()),
  //       GetPage(name: "/signup", page: () => SignupScreen()),
  //       GetPage(name: "/notification", page: () => NotificationScreen()),
  //       GetPage(name: "/mainapp", page: () => MainAppScreen()),
  //       GetPage(
  //           name: "/thirdPersonProfile",
  //           page: () => ThirdPersonProfileScreen()),
  //       GetPage(name: "/hiddenProfile", page: () => HiddenProfile()),
  //       GetPage(name: "/editProfile", page: () => EditProfilePage()),
  //       GetPage(name: "/selectTopics", page: () => SelectTopics()),
  //       GetPage(name: "/messageSingle", page: () => MessageDetail()),
  //       GetPage(name: "/message", page: () => MessagePage()),
  //       GetPage(name: "/comments", page: () => CommentsScreen()),
  //       GetPage(name: "/subscription", page: () => SubscriptionBar()),
  //       GetPage(name: "/password", page: () => ForgotPassword()),
  //       GetPage(name: "/changepassword", page: () => ChangePassword()),
  //     ],
  //     navigatorObservers: [
  //       FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
  //     ],
  //   );
}

// // void main() {
// //   runApp(GetMaterialApp(
// //     unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
// //     initialRoute: '/',
// //     getPages: [
// //       GetPage(name: '/', page: () => MyHomePage()),
// //       GetPage(name: '/second', page: () => Second()),
// //     ],
// //   ));
// // }

// import 'package:flutter/material.dart';

// // Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(App());
// }

// class App extends StatefulWidget {
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   // Set default `_initialized` and `_error` state to false
//   bool _initialized = false;
//   bool _error = false;

//   // Define an async function to initialize FlutterFire
//   void initializeFlutterFire() async {
//     try {
//       // Wait for Firebase to initialize and set `_initialized` state to true
//       await Firebase.initializeApp();
//       setState(() {
//         _initialized = true;
//       });
//     } catch (e) {
//       // Set `_error` state to true if Firebase initialization fails
//       setState(() {
//         _error = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     initializeFlutterFire();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show error message if initialization failed
//     if (_error) {
//       return MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('error'),
//           ),
//         ),
//         debugShowCheckedModeBanner: false,
//       );
//     }

//     // Show a loader until FlutterFire is initialized
//     if (!_initialized) {
//       return MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('loading...'),
//           ),
//         ),
//         debugShowCheckedModeBanner: false,
//       );
//     }

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('here is the app'),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
