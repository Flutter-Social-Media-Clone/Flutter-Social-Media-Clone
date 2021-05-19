import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:cs310insta/utils/style.dart';

class SelectTopics extends StatelessWidget {
  final ShareState shareState = Get.put(ShareState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Topics"),
      ),
      body: Center(
        child: Container(
          child: Form(
            key: shareState.topicKey,
            child: Column(
              children: [
                KFormFieldWidget(
                  kFormField: shareState.topicField1,
                  validator: validator.topicValidator,
                  save: shareState.handleSaveTopic1,
                ),
                SizedBox(height: 12),
                KFormFieldWidget(
                  kFormField: shareState.topicField2,
                  validator: validator.topicValidator,
                  save: shareState.handleSaveTopic2,
                ),
                SizedBox(height: 12),
                KFormFieldWidget(
                  kFormField: shareState.topicField3,
                  validator: validator.topicValidator,
                  save: shareState.handleSaveTopic3,
                ),
                SizedBox(height: 12),
                OutlinedButton(
                  child: Text(
                    "Share",
                    style: login_signupButtonTextStyle,
                  ),
                  onPressed: () => {shareState.handleWrapper()},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
