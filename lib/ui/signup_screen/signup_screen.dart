import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class SignupScreen extends StatelessWidget {
  SignupState signupState = Get.put(SignupState());

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
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 110),
            child: ListView(
              children: [
                Column(
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
                      key: signupState.formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("object");
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return deneme(context);
                                      });
                                  print("hello");
                                },
                                child: Obx(() => signupState.getImage() != null
                                    ? CircleAvatar(
                                        backgroundColor: Colors.white38,
                                        backgroundImage: FileImage(
                                          signupState.getImage(),
                                        ),
                                        radius: 40,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.white38,
                                        backgroundImage: AssetImage(
                                            "assets/images/Couple2.png"),
                                        radius: 40,
                                      )),
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
                            kFormField: signupState.passwordField,
                            validator: validator.passwordValidator,
                            save: signupState.handleSavePass,
                          ),
                          SizedBox(height: 10),
                          KFormFieldWidget(
                            kFormField: signupState.password2Field,
                            validator: validator.passwordValidator,
                            save: signupState.handleSavePass2,
                          ),
                          SizedBox(height: 10),
                          KFormFieldWidget(
                            kFormField: signupState.emailField,
                            validator: validator.emailValidator,
                            save: signupState.handleSaveEmail,
                          ),
                          SizedBox(height: 10),
                          KFormFieldWidget(
                            kFormField: signupState.ageField,
                            validator: validator.ageValidator,
                            save: signupState.handleSaveAge,
                          ),
                          SizedBox(height: 10),
                          // DropdownButton<String>(
                          //   items: model.genderList.map((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          //   onChanged: (value) {
                          //     model.setGender(value);
                          //   },
                          // ),

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
                                  "Signup",
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

  AlertDialog deneme(context) {
    File _imageFile;
    final _picker = ImagePicker();

    return AlertDialog(
      title: Text("Add Profile Photo"),
      backgroundColor: Colors.white,
      content: Container(
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                child: Text(
                  "Load Camera",
                  style: hiddenprofile_ButtonTextStyle,
                ),
                onPressed: () {
                  signupState.imgFromCamera(context);
                },
                style: hiddenprofile_ButtonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                child: Text(
                  "Load Galery",
                  style: hiddenprofile_ButtonTextStyle,
                ),
                onPressed: () {
                  signupState.imgFromGallery(context);
                },
                style: hiddenprofile_ButtonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
