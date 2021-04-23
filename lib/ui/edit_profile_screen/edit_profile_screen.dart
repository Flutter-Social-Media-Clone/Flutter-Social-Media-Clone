import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/ui/signup_screen/signup_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
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
                              kFormField: model.ageField,
                              validator: validator.ageValidator,
                              save: model.handleSaveAge,
                            ),
                            SizedBox(height: 10),
                            InputDecorator(
                              decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text("Select Gender"),
                                  value: (model.gender),
                                  isDense: true,
                                  onChanged: (value) {
                                    model.setGender(value);
                                  },
                                  items: model.genderList.map(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),

                            // KFormFieldWidget(
                            //   kFormField: model.genderField,
                            //   validator: validator.genderValidator,
                            //   save: model.handleSaveGender,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: model.handleSignup,
                                  child: Text(
                                    "Edit Profile",
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
