import 'package:cs310insta/ui/components/messageCardNotification/unread_icon.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import '../../../core/models/cardModel.dart';
import 'unread_icon.dart';

class MessageCardNotification extends StatelessWidget {
  final MessageModel messageFields;

  MessageCardNotification({this.messageFields});

  @override
  Widget build(BuildContext context) {
    String tobeShowed;
    if (this.messageFields.message.length > 30) {
      tobeShowed = this.messageFields.message.substring(0, 27) + "...";
    } else {
      tobeShowed = this.messageFields.message;
    }

    return Container(
      //padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
      //margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
      child: InkWell(
        onTap: () => {Navigator.pushNamed(context, "/messageSingle")},
        child: Card(
          color: notificationBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            width: 320,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white38,
                  backgroundImage: NetworkImage("${this.messageFields.img}"),
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
      ),
    );
  }
}
