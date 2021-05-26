import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePostList extends StatelessWidget {
  final FeedState feedState = Get.put(FeedState());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Obx(
              () => Posts(
                feedState.posts.value,
              ),
            ),
          ],
        ),
      ),
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
