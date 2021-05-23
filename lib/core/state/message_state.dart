import 'package:cs310insta/core/models/cardModel.dart';
import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageState extends GetxController {
  var myselectedConv = "".obs;
  var username = "".obs;
  var userData = {}.obs;
  var toProfile =
      MessageModel(from: "", img: "", is_read: true, message: "", fromUid: "")
          .obs;

  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MyAuth myAuth = Get.put(MyAuth());

  Future<void> getUsername() async {
    var data = await myFirestore.getUser(myAuth.getCurrentUser());
    username.value = data["username"].toString();

    print(data);
  }

  Future<void> getUserData() async {
    userData.value = await myFirestore.getUser(myAuth.getCurrentUser());
  }

  void setmyConv(var userId) {
    myselectedConv.value = userId;
  }

  void setmyConv2(var from, var img) {
    toProfile = MessageModel(
            from: from,
            img: img,
            is_read: true,
            message: "",
            fromUid: myselectedConv.value)
        .obs;
  }
}
