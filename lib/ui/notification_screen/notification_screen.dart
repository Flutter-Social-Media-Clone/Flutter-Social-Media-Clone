import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/analytics.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/notification_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/notificationCard/notification_card.dart';
import 'dart:math';
import '../../core/models/cardModel.dart';

// visit https://protocoderspoint.com/flutter-refresh-indicator-a-pull-to-refresh-listview-with-example/ for pull refresh
//

class NotificationScreen extends StatelessWidget {
  List<NotificationModel> notificationList = List.generate(
      Random().nextInt(15),
      (i) => NotificationModel(
          id: 1,
          timestamp: Timestamp.now(),
          image_url: "asdsda",
          notification: "notification $i"));

  final MyAuth myAuth = Get.put(MyAuth());
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final NotificationState myNotification = Get.put(NotificationState());

  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    //FirebaseCrashlytics.instance.log("Higgs-Boson detected! Bailing out");
    //FirebaseCrashlytics.instance.crash();

    //myAuth.login("gokberk@gmail.com", "12345678");

    //myFirestore.getUser();
    String myUid = myAuth.getCurrentUser();
    // var a =  myFirestore.getNotifications(myUid);
    // print("TTTTTTTTTT" + a.runtimeType.toString());
    myNotification.getMyNotification();
    List<NotificationModel> notificationList =
        myNotification.getMyResults(myUid);

    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 5),
        dragStartBehavior: DragStartBehavior.start,
        addSemanticIndexes: true,
        children: notificationList
            .map((notificationSingle) => NotificationCard(
                  notificationMessage: notificationSingle,
                ))
            .toList(),
      ),
    );
  }
}
