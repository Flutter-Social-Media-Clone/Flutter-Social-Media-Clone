import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/message_state.dart';
import 'package:cs310insta/ui/components/messageCardNotification/unread_icon.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:get/get.dart';
import '../../../core/models/cardModel.dart';
import 'unread_icon.dart';

class MessageCardNotification extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  final MyAuth myAuth = Get.put(MyAuth());
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MessageModel messageFields;
  final MessageState messageState = Get.put(MessageState());

  MessageCardNotification({this.messageFields});

  @override
  Widget build(BuildContext context) {
    String tobeShowed;
    if (this.messageFields.message.length > 30) {
      tobeShowed = this.messageFields.message.substring(0, 27) + "...";
    } else {
      tobeShowed = this.messageFields.message;
    }
    print("id:" + this.messageFields.docId);

    String tobeShowedusername;
    if (this.messageFields.toUsername.length > 20) {
      tobeShowedusername =
          this.messageFields.toUsername.substring(0, 17) + "...";
    } else {
      tobeShowedusername = this.messageFields.toUsername;
    }
    print("id:" + this.messageFields.docId);

    var c = Duration(
        seconds:
            (Timestamp.now().seconds - this.messageFields.timestamp.seconds));
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
        child: StreamBuilder(
            stream: firestoreInstance
                .collection('messages')
                //.doc("users")
                //.collection(myAuth.getCurrentUser())
                .doc(myAuth.getCurrentUser())
                //.doc("friends")
                //.doc("toUsers")
                //.where("username", isEqualTo: "deneme")
                .collection("friends")
                // .orderBy('timestamp', descending: true)
                //.limit(1)
                //.get()
                //.then((QuerySnapshot querySnapshot) {}),
                //.snapshots(),
                //.where('users', isEqualTo: myAuth.getCurrentUser())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return new Text("Error!");
              } else {
                //var docs = snapshot.data.docs.map((doc) => doc);

                print("messagecard");
              }
              // final toUsername =
              //     myFirestore.getUser(this.messageFields.fromUid);
              return InkWell(
                onTap: () => {
                  print("\n\n\n\n\nmessageFields.from" +
                      this.messageFields.from.toString()),
                  print("messageFields.fromUid" +
                      this.messageFields.fromUid.toString()),
                  print("\n\n\n\n\n\n\n\n\n."),
                  messageState.setmyConv(this.messageFields.fromUid),
                  messageState.setmyConv2(
                      this.messageFields.toUsername, this.messageFields.img),
                  myFirestore.changeReadStatus(
                    myAuth.getCurrentUser(),
                    this.messageFields.fromUid,
                    this.messageFields.img,
                    this.messageFields.message,
                    this.messageFields.timestamp,
                    this.messageFields.from,
                    this.messageFields.docId,
                  ),
                  Navigator.pushNamed(
                    context,
                    "/messageSingle",
                  )
                },
                child: Card(
                  color: notificationBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: SizedBox(
                    width: 320,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white38,
                          backgroundImage:
                              NetworkImage("${this.messageFields.img}"),
                          radius: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text(
                                "${tobeShowedusername}",
                                style: notificationMessageText,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Text(
                                "${tobeShowed}",
                                style: notificationDateText,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Text(
                                      "${tobeShowedDate}",
                                      style: notificationDateText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              UnreadIcon(
                                is_read: this.messageFields.is_read,
                              ),
                            ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
