import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import '../../../core/models/cardModel.dart';
import '../messageCard/message_card.dart';

class MessageDetail extends StatelessWidget {
  //final MessageModel messageFields;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [Text("Message Box"), Text("to: mee")]),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          child: Stack(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: messageList
                      .map((messageSingle) => MessageCard(
                            messageFields: messageSingle,
                            myname: "deir",
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 18,
                      child: Card(
                        color: Colors.amber,
                        child: TextField(
                          onSubmitted: (e) => {print(e)},
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: InkWell(
                            child: Icon(Icons.send),
                            onTap: () => {print("send message")},
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
