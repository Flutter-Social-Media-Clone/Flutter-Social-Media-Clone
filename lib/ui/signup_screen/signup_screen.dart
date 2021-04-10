import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'signup_viewmodel.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text('Flutter Demo Home Page'),
        // ),
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 6, 146, 0.8),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 45, 0, 25),
            padding: EdgeInsets.fromLTRB(25, 105, 25, 45),
            decoration: backgroundDecoration,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sign Up",
                      style: headerGradient,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white38,
                            backgroundImage:
                                AssetImage("assets/images/Couple2.png"),
                            radius: 40,
                          ),
                        ],
                      ),
                      KFormFieldWidget(
                        kFormField: model.usernameField,
                        validator: validator.usernameValidator,
                        save: model.handleSaveUsername,
                      ),
                      SizedBox(height: 10),
                      KFormFieldWidget(
                        kFormField: model.passwordField,
                        validator: validator.passwordValidator,
                        save: model.handleSavePass,
                      ),
                      SizedBox(height: 10),
                      KFormFieldWidget(
                        kFormField: model.password2Field,
                        validator: validator.passwordValidator,
                        save: model.handleSavePass2,
                      ),
                      SizedBox(height: 10),
                      KFormFieldWidget(
                        kFormField: model.emailField,
                        validator: validator.emailValidator,
                        save: model.handleSaveEmail,
                      ),
                      SizedBox(height: 10),
                      KFormFieldWidget(
                        kFormField: model.genderField,
                        validator: validator.genderValidator,
                        save: model.handleSaveGender,
                      ),
                      SizedBox(height: 10),
                      KFormFieldWidget(
                        kFormField: model.ageField,
                        validator: validator.ageValidator,
                        save: model.handleSaveAge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: model.handleSignup,
                            child: Text("Signup"),
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
      ),
    );
  }
}
