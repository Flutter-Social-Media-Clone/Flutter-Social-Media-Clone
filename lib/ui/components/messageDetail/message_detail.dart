import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/message_state.dart';
import 'package:cs310insta/core/state/my_profile_state.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/models/cardModel.dart';
import '../messageCard/message_card.dart';

class MessageDetail extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  final MyAuth myAuth = Get.put(MyAuth());
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MessageState messageState = Get.put(MessageState());
  final MyProfileState myProfileState = Get.put(MyProfileState());
  final _formKey = GlobalKey<FormState>();
  //final MessageModel messageFields
  var message = "";
  final ScrollController listScrollController = ScrollController();

  //MessageDetail({this.messageFields});
  //getter

  List<MessageModel> messageList = [
    MessageModel(
        from: "demir",
        img: "https://randomuser.me/api/portraits/women/4.jpg",
        is_read: true,
        message: "hi fella, whatzup"),
    MessageModel(
        from: "dmir",
        img: "https://randomuser.me/api/portraits/women/4.jpg",
        is_read: false,
        message: "hi fella, whatzup"),
    MessageModel(
        from: "demir",
        img: "https://randomuser.me/api/portraits/women/4.jpg",
        is_read: false,
        message:
            "hi fella, whatzup are you fuckin kidding me cuz you are bit of bitch"),
    MessageModel(
        from: "deir",
        img: "https://randomuser.me/api/portraits/women/4.jpg",
        is_read: false,
        message:
            "hi fella, whatzup are you fuckin kidding me cuz you are bit of bitch"),
    MessageModel(
        from: "deir",
        img: "https://randomuser.me/api/portraits/women/4.jpg",
        is_read: false,
        message: "yazmıyon ya piç :p"),
  ];
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("ddddd" + messageState.toProfile.value.from);
    print("mynameee:" + myProfileState.userData.value["username"]);
    print("Path:" +
        myAuth.getCurrentUser() +
        "to" +
        messageState.myselectedConv.value.toString());
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text("Message Box"),
          Text("to: ${messageState.toProfile.value.from}")
        ]),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          child: Stack(
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                    stream: firestoreInstance
                        .collection('messages')
                        .doc(myAuth.getCurrentUser())
                        .collection("friends")
                        .doc(messageState.myselectedConv.value)
                        .collection("messageList")
                        .orderBy("timestamp", descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return new Text("Error!");
                      } else if (snapshot.data == null) {
                        return new Text("Loading!");
                      } else {
                        // print("geldi dayı" +
                        //     snapshot.data.docs.length.toString());

                        // print(snapshot.data);
                        // print(snapshot.data.docs.map((doc) => doc.data()));
                        var docs = snapshot.data.docs.map((doc) => doc.data());
                        print(docs);
                        var b = List<MessageModel>();
                        docs.forEach((doc) {
                          if (doc["username"] == null) {
                            print("sdfsdfdsfs");
                          }
                          print(doc["text"]);
                          //print(doc.id);
                          b.add(
                            MessageModel(
                              from: doc["username"],
                              img: doc["imgUrl"],
                              is_read: doc["isRead"],
                              message: doc["text"],
                            ),
                          );

                          //
                        });

                        return ListView(
                          children: b
                              .map((doc) => MessageCard(
                                    messageFields: doc,
                                    myname: myProfileState
                                        .userData.value["username"],
                                  ))
                              .toList(),
                          reverse: false,
                          controller: listScrollController,
                        );
                        return Text("aaa");
                      }
                    }),

                // ListView(
                //   children: messageList
                //       .map((messageSingle) => MessageCard(
                //             messageFields: messageSingle,
                //             myname: myProfileState.userData.value["username"],
                //           ))
                //       .toList(),
                // ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 18,
                        child: Card(
                          color: Colors.amber,
                          child: TextFormField(
                            controller: _controller,
                            onChanged: (e) {
                              message = e;
                            },

                            //onSubmitted: (e) => {print(e)},
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: InkWell(
                              child: Icon(Icons.send),
                              onTap: () => {
                                print(
                                    "\n\n\n\n\n\n\n\n\nsend message" + message),
                                print("toUid" +
                                    messageState.toProfile.value.fromUid),
                                print("fromUid" + myAuth.getCurrentUser()),
                                print("isRead" + true.toString()),
                                print("text" + message),
                                print("toUsername" +
                                    messageState.toProfile.value.from),
                                print("fromUsername" +
                                    myProfileState.userData.value["username"]),
                                print("\n\n\n\n\n\n\n\n\n."),
                                myFirestore.sendMessage(
                                    messageState.toProfile.value.fromUid,

                                    // messageState.myselectedConv
                                    //     .value, // to yanlış geliyo
                                    myAuth.getCurrentUser(),
                                    true,
                                    message, //"text from: demo321--->> to:demo2editted",
                                    messageState.toProfile.value.from,
                                    myProfileState.userData.value["username"],
                                    messageState.toProfile.value.img,
                                    myProfileState.userData.value["imgUrl"]),
                                message = "",
                                _controller.clear(),
                              },
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
