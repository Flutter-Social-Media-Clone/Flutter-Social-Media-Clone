import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/style.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class LoginScreen extends StatelessWidget {
  final LoginState loginState = Get.put(LoginState());

  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('Flutter Demo Home Page'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: appBackgroundColor,
        ),
        child: Container(
          margin: loginSignupMargin,
          padding: loginSignupPadding,
          decoration: backgroundDecoration,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Login",
                    style: headerGradient,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Form(
                key: loginState.formKey,
                child: Column(
                  children: [
                    KFormFieldWidget(
                      kFormField: loginState.emailField,
                      validator: validator.emailValidator,
                      save: loginState.handleSaveEmail,
                    ),
                    SizedBox(height: 12),
                    KFormFieldWidget(
                      kFormField: loginState.passwordField,
                      validator: validator.passwordValidator,
                      save: loginState.handleSavePass,
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: loginState.handleLogin,
                          child: Text(
                            "Login",
                            style: login_signupButtonTextStyle,
                          ),
                          style: login_signupButtonStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//           decoration: BoxDecoration(
//             color: Color.fromRGBO(0, 6, 146, 0.8),
//           ),
//           child: Container(
//             margin: EdgeInsets.fromLTRB(0, 45, 0, 25),
//             padding: EdgeInsets.fromLTRB(25, 105, 25, 45),
//             decoration: backgroundDecoration,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Welcome",
//                   style: headerGradient,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.white38,
//                   backgroundImage: AssetImage("assets/images/Couple2.png"),
//                   radius: 140,
//                 ),
//                 Text(
//                   "My Welcome sub text",
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(width: 16),
//                     Expanded(
//                       flex: 1,
//                       child: OutlinedButton(
//                         style: login_signupButtonStyle,
//                         child: Text(
//                           "Login",
//                           style: login_signupButtonTextStyle,
//                         ),
//                         onPressed: () => model.navigate_login(context),
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                     Expanded(
//                       flex: 1,
//                       child: OutlinedButton(
//                         style: login_signupButtonStyle,
//                         child: Text(
//                           "Signup",
//                           style: login_signupButtonTextStyle,
//                         ),
//                         onPressed: () => model.navigate_signup(context),
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
