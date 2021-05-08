import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/ui/f_password_screen/password_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<PasswordViewModel>.reactive(
      viewModelBuilder: () => PasswordViewModel(),
      builder: (context, model, child) => Scaffold(
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
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 110),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password",
                            style: headerG,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            KFormFieldWidget(
                              kFormField: model.emailField,
                              validator: validator.emailValidator,
                              save: model.handleSaveEmail,
                            ),
                            SizedBox(height: 60),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: model.handlePassword,
                                  child: Text(
                                    "Reset Password",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
