import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class EditProfilePage extends StatelessWidget {
  SignupState signupState = Get.put(SignupState());

  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return Scaffold(
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
                      key: signupState.formKey,
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
                            kFormField: signupState.usernameField,
                            validator: validator.usernameValidator,
                            save: signupState.handleSaveUsername,
                          ),

                          SizedBox(height: 10),
                          KFormFieldWidget(
                            kFormField: signupState.ageField,
                            validator: validator.ageValidator,
                            save: signupState.handleSaveAge,
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
                              child: Obx(
                                () => DropdownButton<String>(
                                  hint: Text("Select Gender"),
                                  value: signupState.gender.value != ""
                                      ? signupState.gender.value
                                      : null,
                                  isDense: true,
                                  onChanged: (value) {
                                    signupState.setGender(value);
                                  },
                                  items: signupState.genderList.map(
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
                                onPressed: signupState.handleSignup,
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
    );
  }
}
