import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import 'comments_card_viewmodel.dart';
import '../../../core/models/cardModel.dart';

class CommentsCard extends StatelessWidget {
  final CommentsModel commentBody;

  CommentsCard({this.commentBody});
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
      //margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
      child: Card(
        color: notificationBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: 320,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.white38,
                  backgroundImage: AssetImage(
                      "assets/images/Couple2.png"), //"${this.commentBody.pp_url}"
                  radius: 30,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Text(
                      "${this.commentBody.name}",
                      style: notificationMessageText,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 300,
                    child: Text(
                      "${this.commentBody.commentText}",
                      style: notificationDateText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      "${this.commentBody.date}",
                      style: notificationDateText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
