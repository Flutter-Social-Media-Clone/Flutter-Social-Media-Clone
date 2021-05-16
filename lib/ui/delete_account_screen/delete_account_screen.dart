import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class DeleteAccountScreen extends StatelessWidget {
  SignupState signupState = Get.put(SignupState());
  final MyProfileState myProfileState = Get.put(MyProfileState());
  final firestoreInstance = FirebaseFirestore.instance;
  final MyAuth myAuth = Get.put(MyAuth());

  @override
  Widget build(BuildContext context) {
    print("delete_account_screen.dart");
    // ViewModelBuilder is what provides the view model to the widget tree.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Delete Profile'),
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
                              Text(
                                "Are you sure you \nwant to delete Account?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () => {
                                  firestoreInstance
                                      .collection('users')
                                      .doc(myAuth.getCurrentUser())
                                      .delete(),
                                  Get.offAllNamed("/welcome")
                                },
                                child: Text(
                                  "Delete Profile",
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
