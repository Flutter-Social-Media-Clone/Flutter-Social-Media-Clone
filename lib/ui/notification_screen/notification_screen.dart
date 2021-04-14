import 'package:cs310insta/ui/components/bottom_bar/bottom_bar.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';
import '../components/notificationCard/notification_card.dart';
import '../components/notificationCard/notification_card_viewmodel.dart';
import 'notification_viewmodel.dart';
import 'dart:async';
import 'dart:math';
import 'dart:convert';
import '../../core/models/cardModel.dart';

// visit https://protocoderspoint.com/flutter-refresh-indicator-a-pull-to-refresh-listview-with-example/ for pull refresh
//

class NotificationScreen extends StatelessWidget {
  List<NotificationModel> notificationList = List.generate(
      Random().nextInt(15),
      (i) => NotificationModel(
          id: 1,
          date: "$i h ago",
          image_url: "asdsda",
          notification: "notification $i"));
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<NotificationViewModel>.reactive(
      viewModelBuilder: () => NotificationViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: feedBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Notifications'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 5),
          dragStartBehavior: DragStartBehavior.start,
          addSemanticIndexes: true,
          children: notificationList
              .map((notificationSingle) => NotificationCard(
                    notificationMessage: notificationSingle,
                  ))
              .toList(),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
