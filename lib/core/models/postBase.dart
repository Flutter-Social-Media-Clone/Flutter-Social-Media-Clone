import 'package:cs310insta/utils/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

abstract class PostBase extends StatelessWidget {
  final NetworkImage profileImage;
  final String username;
  PostBase({this.profileImage, this.username});
}

class ImagePost extends PostBase {
  final NetworkImage image;
  ImagePost({this.image, NetworkImage profileImage, String username})
      : super(profileImage: profileImage, username: username);

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
              PostHeader(profileImage: profileImage, username: username),
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
  }) : super(key: key);

  final NetworkImage profileImage;
  final String username;

  @override
  Widget build(BuildContext context) {
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
              child: Icon(
                Icons.more_horiz,
                size: 25,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class TextPost extends PostBase {
  final String text;
  TextPost({this.text, username, profileImage})
      : super(profileImage: profileImage, username: username);

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
              PostHeader(profileImage: profileImage, username: username),
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
