import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import '../../../core/models/cardModel.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationMessage;

  NotificationCard({this.notificationMessage});
  @override
  Widget build(BuildContext context) {
    var c = Duration(
        seconds: (Timestamp.now().seconds -
            this.notificationMessage.timestamp.seconds));
    String tobeShowedDate = "now";
    print("timeeeeee in days:" + c.inDays.toString());
    print("timeeeeee:" + c.inHours.toString());
    print("timeeeeee:" + c.inMinutes.toString());
    if (c.inDays > 0) {
      tobeShowedDate = c.inDays.toString() + " day";
    } else if (c.inHours > 0) {
      tobeShowedDate = c.inHours.toString() + " hour";
    } else if (c.inMinutes > 0) {
      tobeShowedDate = c.inMinutes.toString() + " min";
    } else {
      tobeShowedDate = "now";
    }
    return Container(
      //padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
      //margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
      child: Card(
        color: notificationBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: 320,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white38,
                backgroundImage: AssetImage("assets/images/Couple2.png"),
                radius: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 80,
                    width: 200,
                    child: Text(
                      "${this.notificationMessage.notification}",
                      style: notificationMessageText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      "${tobeShowedDate}", //"${this.notificationMessage.timestamp}",
                      style: notificationDateText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
