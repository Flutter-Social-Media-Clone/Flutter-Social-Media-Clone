import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'welcome_viewmodel.dart';
import '../../utils/style.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 6, 146, 0.8),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 45, 0, 25),
            padding: EdgeInsets.fromLTRB(25, 105, 25, 45),
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
                Text(
                  "My Welcome sub text",
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
                        onPressed: () => model.navigate_login(context),
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
                        onPressed: () => model.navigate_signup(context),
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
