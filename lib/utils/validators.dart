import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/signup_state.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

dynamic emailValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your email";
  }
  return null;
}

dynamic topicValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your email";
  } else if (value[0] != "#") {
    return "Topic should start with an #";
  } else if (value.length < 4) {
    return "Topic must be at least 3 characters";
  }
  return null;
}

dynamic passwordValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your password";
  } else if (value.length < 4) {
    return "Password must be at least 4 characters";
  }
  return null;
}

dynamic usernameValidator(String value) {
  // final SignupState signUpState = Get.put(SignupState());
  if (value.isEmpty) {
    return "Please enter your username";
  }
  // print("username validator: ${signUpState.doesExist.value}");
  // if (signUpState.doesExist.value != true) {
  //   return "Username already taken";
  // }

  return null;
}

dynamic genderValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your gender identity";
  }
  return null;
}

dynamic ageValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your age";
  }
  return null;
}
