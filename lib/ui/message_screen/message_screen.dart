import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/bottom_bar.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/message_state.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:get/get.dart';
import '../components/messageCardNotification/message_card.dart';
import '../components/messageCardNotification/message_card_viewmodel.dart';
import 'message_viewmodel.dart';
import 'dart:async';
import 'dart:math';
import 'dart:convert';
import '../../core/models/cardModel.dart';

// visit https://protocoderspoint.com/flutter-refresh-indicator-a-pull-to-refresh-listview-with-example/ for pull refresh
//

class MessagePage extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  final MyAuth myAuth = Get.put(MyAuth());
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MessageState messageState = Get.put(MessageState());

  //List<MessageModel> messageList = [];
  //   MessageModel(
  //       from: "demir",
  //       img: "https://randomuser.me/api/portraits/women/4.jpg",
  //       is_read: true,
  //       message: "hi fella, whatzup"),
  //   MessageModel(
  //       from: "demir",
  //       img: "https://randomuser.me/api/portraits/women/4.jpg",
  //       is_read: false,
  //       message: "hi fella, whatzup"),
  //   MessageModel(
  //       from: "demir",
  //       img: "https://randomuser.me/api/portraits/women/4.jpg",
  //       is_read: false,
  //       message:
  //           "hi fella, whatzup are you fuckin kidding me cuz you are bit of bitch"),
  // ];

  @override
  Widget build(BuildContext context) {
    print("\n\n\n");

    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: Container(
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
                .orderBy('timestamp', descending: true)
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
                print("geldi dayı");
                print(snapshot.data.docs.map((doc) => doc.data()));
                var docs = snapshot.data.docs.map((doc) => doc);
                print(docs);
                // ({imgUrl: https:firebasestorage.googleapis.com/v0/b/cs310insta-5b3c1.appspot.com/o/profilePhotos%2Fdd%20demir.jpg?alt=media&token=fbc6e69f-e388-4f55-a74a-c78f8c98fa7d, isRead: false, timestamp: Timestamp(seconds=1621686725, nanoseconds=823999000), username: dd demir, lastMessage: eee},
                // {imgUrl: https://firebasestorage.googleapis.com/v0/b/cs310insta-5b3c1.appspot.com/o/profilePhotos%2Fdemo2editted.jpg?alt=media&token=241aae4d-d02a-4f64-9b1e-acd0327ce9a7, isRead: false, timestamp: Timestamp(seconds=1621673663, nanoseconds=91000000), username: demo2editted, lastMessage: ew})
                var b = List<MessageModel>();
                docs.forEach((doc) {
                  // print(doc["timestamp"]);
                  // print(doc.id);
                  b.add(
                    MessageModel(
                        from: doc["username"],
                        img: doc["imgUrl"],
                        is_read: doc["isRead"],
                        message: doc["lastMessage"],
                        fromUid: doc.id,
                        timestamp: doc["timestamp"],
                        docId: doc["docId"],
                        toUsername: doc["username"]),
                  );
                  // return MessageCardNotification(
                  //   messageFields: MessageModel(
                  //       from: doc["username"],
                  //       img: doc["imgUrl"],
                  //       is_read: doc["isRead"],
                  //       message: doc["lastMessage"]),
                  // );
                });
                print(b);
                //print(a);
                //print(snapshot.data.docs[myAuth.getCurrentUser()]);
                // snapshot.data.forEach((doc) {
                //   print("---->>" + doc.toString());
                //   //print(doc[doc.id] + "<<---");
                // });
//                 snapshot.data.docs.map((json) => {print(json)}).toList();
// var docs =
//          querySnapshot.docs.map(json.decode(json.encode(doc.data())));
                // return ListView.builder(
                //   itemCount: snapshot.data.docs.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     //Map<dynamic, dynamic> map = snapshot.data.docs[index];

                //     final coinLinks =
                //         map["toUser"] as List<Map<String, dynamic>>;
                //     return ListTile(
                //       title: Column(
                //           children: coinLinks.map((coinLink) {
                //         return Text(coinLink["title"]);
                //       }).toList()),
                //     );
                //   },
                // );
                return ListView(
                  children: b
                      .map((doc) => MessageCardNotification(
                            messageFields: doc,
                          ))
                      .toList(),
                );
                return Text("aaa");
              }
            }),
      ),
    );
  }
}

// class MessagePage extends StatelessWidget {
//   List<NotificationModel> notificationList = List.generate(
//       Random().nextInt(15),
//       (i) => NotificationModel(
//           id: 1,
//           date: "$i h ago",
//           image_url: "asdsda",
//           notification: "notification $i"));
//   @override
//   Widget build(BuildContext context) {
//     // ViewModelBuilder is what provides the view model to the widget tree.
//     return ViewModelBuilder<MessagePageModel>.reactive(
//       viewModelBuilder: () => MessagePageModel(),
//       builder: (context, model, child) => Expanded(
//         child: ListView(
//           padding: EdgeInsets.fromLTRB(12, 12, 12, 5),
//           dragStartBehavior: DragStartBehavior.start,
//           addSemanticIndexes: true,
//           children: notificationList
//               .map((notificationSingle) => NotificationCard(
//                     notificationMessage: notificationSingle,
//                   ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
