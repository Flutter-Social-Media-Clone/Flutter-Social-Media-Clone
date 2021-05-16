import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/style.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class WelcomeScreen extends StatelessWidget {
  final MyAuth myAuth = Get.put(MyAuth());

  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: appBackgroundColor,
        ),
        child: Container(
          margin: loginSignupMargin,
          padding: loginSignupPadding,
          decoration: backgroundDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome",
                style: headerGradient,
              ),
              CircleAvatar(
                backgroundColor: Colors.white38,
                backgroundImage: AssetImage("assets/images/Couple2.png"),
                radius: 140,
              ),
              // Text(
              //   "My Welcome sub text",
              // ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      style: login_signupButtonStyle,
                      child: Text(
                        "Sign in with Google",
                        style: login_signupButtonTextStyle,
                      ),
                      onPressed: () => {myAuth.googleSignin()},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      style: login_signupButtonStyle,
                      child: Text(
                        "Login",
                        style: login_signupButtonTextStyle,
                      ),
                      onPressed: () => Get.toNamed("/login"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      style: login_signupButtonStyle,
                      child: Text(
                        "Signup",
                        style: login_signupButtonTextStyle,
                      ),
                      onPressed: () => Get.toNamed("/signup"),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
