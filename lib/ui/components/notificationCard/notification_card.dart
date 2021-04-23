import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';
import 'notification_card_viewmodel.dart';
import '../../../core/models/cardModel.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationMessage;

  NotificationCard({this.notificationMessage});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationCardViewModel>.reactive(
      viewModelBuilder: () => NotificationCardViewModel(),
      builder: (context, model, child) => Container(
        //padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
        //margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Card(
          color: notificationBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            width: 320,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white38,
                  backgroundImage: AssetImage("assets/images/Couple2.png"),
                  radius: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: Text(
                        "${this.notificationMessage.notification}",
                        style: notificationMessageText,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        "${this.notificationMessage.date}",
                        style: notificationDateText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
