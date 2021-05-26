import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

abstract class PostBase extends StatelessWidget {
  final NetworkImage profileImage;
  final String username;
  final bool isMine;
  final String postId;
  PostBase({this.profileImage, this.username, this.isMine, this.postId});
}

class ImagePost extends PostBase {
  final NetworkImage image;
  ImagePost(
      {this.image,
      NetworkImage profileImage,
      String username,
      bool isMine,
      String postId})
      : super(
            profileImage: profileImage,
            username: username,
            isMine: isMine,
            postId: postId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              PostHeader(
                  profileImage: profileImage,
                  username: username,
                  isMine: isMine,
                  postId: postId),
              PostHeaderDivider(),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: image,
                  width: 800,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key key,
    @required this.profileImage,
    @required this.username,
    @required this.isMine,
    @required this.postId,
  }) : super(key: key);

  final NetworkImage profileImage;
  final String username;
  final bool isMine;
  final String postId;

  @override
  Widget build(BuildContext context) {
    final MyFirestore myFirestore = Get.put(MyFirestore());
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
                child: CircleAvatar(
                  backgroundImage: this.profileImage,
                  backgroundColor: Colors.grey[400],
                  radius: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  username,
                  style: searchResultTextStyle,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
                child: InkWell(
                  child: Icon(Icons.more_horiz, size: 25),
                  onTap: () {
                    isMine
                        ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                //title: Text("Add Comment"),
                                content: Container(
                                  height: 160,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              child: Icon(Icons.close),
                                              onTap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                      OutlinedButton(
                                          child: Text("Delete"),
                                          onPressed: () {
                                            print("Delete this post" + postId);
                                            myFirestore.deletePost(postId);
                                          }),
                                      OutlinedButton(
                                          child: Text("Update"),
                                          onPressed: () {
                                            print("Update this post" + postId);
                                            //TODO: post update sayfasına yönlendir
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                //title: Text("Add Comment"),
                                content: Container(
                                  height: 160,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              child: Icon(Icons.close),
                                              onTap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                      OutlinedButton(
                                          child: Text("Report"),
                                          onPressed: () async {
                                            print("Report this post" + postId);

                                            String username =
                                                'cs310insta@gmail.com';
                                            String password = 'cs310insta1234';

                                            final smtpServer =
                                                gmail(username, password);
                                            // Use the SmtpServer class to configure an SMTP server:
                                            // final smtpServer = SmtpServer('smtp.domain.com');
                                            // See the named arguments of SmtpServer for further configuration
                                            // options.

                                            // Create our message.
                                            final message = Message()
                                              ..from = Address(
                                                  username, 'Cs310Insta')
                                              ..recipients.add(
                                                  'demirdemirel@sabanciuniv.edu')
                                              ..ccRecipients.addAll([
                                                'cs310insta@gmail.com',
                                                'kayakapagan@sabanciuniv.edu',
                                                "gokberkyar@sabanciuniv.edu"
                                              ])
                                              //..bccRecipients.add(Address('bccAddress@example.com'))
                                              ..subject = "Report this post" +
                                                  postId +
                                                  "${DateTime.now()}"
                                              ..text =
                                                  "Report this post" + postId;
                                            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                                            try {
                                              final sendReport = await send(
                                                  message, smtpServer);
                                              print('Message sent: ' +
                                                  sendReport.toString());
                                            } on MailerException catch (e) {
                                              print('Message not sent.');
                                              for (var p in e.problems) {
                                                print(
                                                    'Problem: ${p.code}: ${p.msg}');
                                              }
                                            }
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            });
                  },
                )
                // Icon(
                //   Icons.more_horiz,
                //   size: 25,
                // ),

                ),
          ]),
        ),
      ],
    );
  }
}

class TextPost extends PostBase {
  final String text;
  final bool isMine;
  TextPost({this.text, username, profileImage, this.isMine, postId})
      : super(
            profileImage: profileImage,
            username: username,
            isMine: isMine,
            postId: postId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PostHeader(
                profileImage: profileImage,
                username: username,
                isMine: isMine,
                postId: postId,
              ),
              PostHeaderDivider(),
              Text(
                this.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostHeaderDivider extends StatelessWidget {
  const PostHeaderDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 20,
      thickness: 2,
    );
  }
}

class Posts extends StatelessWidget {
  final List<PostBase> items;

  Posts(this.items);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: this.items,
      ),
    );
    //  return ListView(
    //   // padding: const EdgeInsets.all(8),
    //   children: this.items,
    //   shrinkWrap: true,
    // );
  }
}
