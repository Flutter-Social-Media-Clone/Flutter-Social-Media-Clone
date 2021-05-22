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
              return InkWell(
                onTap: () => {
                  messageState.setmyConv(this.messageFields.docId),
                  messageState.setmyConv2(
                      this.messageFields.from, this.messageFields.img),
                  myFirestore.changeReadStatus(
                    myAuth.getCurrentUser(),
                    this.messageFields.docId,
                    this.messageFields.img,
                    this.messageFields.message,
                    this.messageFields.timestamp,
                    this.messageFields.from,
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
                                "${this.messageFields.from}",
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
                                      "now",
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
