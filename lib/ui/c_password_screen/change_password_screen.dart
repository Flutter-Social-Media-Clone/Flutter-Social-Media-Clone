import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/ui/f_password_screen/password_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'change_password_viewmodel.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
      viewModelBuilder: () => ChangePasswordViewModel(),
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
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Change Password",
                            style: ChangeP,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 60),
                            KFormFieldWidget(
                              kFormField: model.passwordField,
                              validator: validator.emailValidator,
                              save: model.handleSavePass,
                            ),
                            SizedBox(height: 10),
                            KFormFieldWidget(
                              kFormField: model.newpasswordField,
                              validator: validator.emailValidator,
                              save: model.handleSaveNewPass,
                            ),
                            SizedBox(height: 10),
                            KFormFieldWidget(
                              kFormField: model.newpassword2Field,
                              validator: validator.emailValidator,
                              save: model.handleSaveNewPass2,
                            ),
                            SizedBox(height: 20),

                            // KFormFieldWidget(
                            //   kFormField: model.genderField,
                            //   validator: validator.genderValidator,
                            //   save: model.handleSaveGender,
                            // ),
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
