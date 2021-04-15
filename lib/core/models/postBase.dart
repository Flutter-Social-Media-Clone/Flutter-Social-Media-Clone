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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: this.profileImage,
                    backgroundColor: Colors.grey[400],
                    radius: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      username,
                      style: searchResultTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(Icons.more_horiz),
                  ),
                ],
              ),
              Divider(
                height: 30,
                thickness: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: image,
                  width: 800,
                  height: 400,
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

// class TextPost extends PostBase {
//   final NetworkImage image;
//   PeopleSearchResult({this.image}) : super(text: text);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
//         child: Padding(
//           padding: EdgeInsets.all(4.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 backgroundImage: this.image,
//                 backgroundColor: Colors.grey[400],
//                 radius: 30,
//               ),
//               SizedBox(width: 30),
//               Text(
//                 text,
//                 style: searchResultTextStyle,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
