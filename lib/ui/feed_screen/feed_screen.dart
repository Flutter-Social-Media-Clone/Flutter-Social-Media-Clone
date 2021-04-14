import 'package:cs310insta/core/models/postBase.dart';
import 'package:flutter/material.dart';

class ImagePostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Posts(
      [
        ImagePost(
          username: "Gokberk",
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          profileImage: NetworkImage(
            "https://randomuser.me/api/portraits/women/3.jpg",
          ),
        ),
        ImagePost(
          username: "Gokberk",
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          profileImage: NetworkImage(
            "https://randomuser.me/api/portraits/women/3.jpg",
          ),
        ),
        ImagePost(
          username: "Gokberk",
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/4.jpg",
          ),
          profileImage: NetworkImage(
            "https://randomuser.me/api/portraits/women/3.jpg",
          ),
        ),
      ],
    );
  }
}

// class ImageFeed extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;

//     // return SingleChildScrollView(
//     // child: Stack(
//     // children:ImagePostList().toList(),
//     // );
//     return Container(
//       constraints: BoxConstraints(maxHeight: height - 180),
//       margin: EdgeInsets.symmetric(vertical: 50),
//       child: ImagePostList(),
//     );
//   }
// }
