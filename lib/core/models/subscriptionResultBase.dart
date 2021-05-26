import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_viewmodel.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_screen.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

abstract class SubscriptionResultBase extends StatelessWidget {
  final String id;
  final String text;
  SubscriptionResultBase({this.text, this.id});
}

class FollowersSubscription extends SubscriptionResultBase {
  final NetworkImage image;
  FollowersSubscription({text, this.image, id}) : super(text: text, id: id);

  @override
  Widget build(BuildContext context) {
    String tobeShowed;
    if (this.text.length > 15) {
      tobeShowed = this.text.substring(0, 12) + "...";
    } else {
      tobeShowed = this.text;
    }
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/thirdPersonProfile/$id",
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: this.image,
                        backgroundColor: Colors.grey[400],
                        radius: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "$tobeShowed",
                        style: searchResultTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  OutlinedButton(
                    child: Text(
                      "Unfollow",
                      style: unf_ButtonTextStyle,
                    ),
                    style: unf_ButtonStyle,
                    onPressed: () {},
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

class FollowingSubscription extends SubscriptionResultBase {
  final NetworkImage image;
  FollowingSubscription({text, this.image, id}) : super(text: text, id: id);
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MyAuth myAuth = Get.put(MyAuth());
  @override
  Widget build(BuildContext context) {
    String tobeShowed;
    if (this.text.length > 15) {
      tobeShowed = this.text.substring(0, 12) + "...";
    } else {
      tobeShowed = this.text;
    }
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/thirdPersonProfile/$id",
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: this.image,
                        backgroundColor: Colors.grey[400],
                        radius: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "$tobeShowed",
                        style: searchResultTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  OutlinedButton(
                    child: Text(
                      "Unfollow",
                      style: unf_ButtonTextStyle,
                    ),
                    style: unf_ButtonStyle,
                    onPressed: () {
                      myFirestore.deleteFriendship(myAuth.getCurrentUser(), id);
                    },
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

class TopicSubscription extends SubscriptionResultBase {
  TopicSubscription({text, id}) : super(text: text, id: id);

  @override
  Widget build(BuildContext context) {
    String tobeShowed;
    if (this.text.length > 15) {
      tobeShowed = this.text.substring(0, 12) + "...";
    } else {
      tobeShowed = this.text;
    }
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "#$tobeShowed",
                        style: searchResultTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  OutlinedButton(
                    child: Text(
                      "Unfollow",
                      style: unf_ButtonTextStyle,
                    ),
                    style: unf_ButtonStyle,
                    onPressed: () {},
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

class LocationSubscription extends SubscriptionResultBase {
  LocationSubscription({text, id}) : super(text: text, id: id);
  @override
  Widget build(BuildContext context) {
    String tobeShowed;
    if (this.text.length > 15) {
      tobeShowed = this.text.substring(0, 12) + "...";
    } else {
      tobeShowed = this.text;
    }
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text(
                        "$tobeShowed",
                        style: searchResultTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  OutlinedButton(
                    child: Text(
                      "Unfollow",
                      style: unf_ButtonTextStyle,
                    ),
                    style: unf_ButtonStyle,
                    onPressed: () {},
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

class SubscriptionResult extends StatelessWidget {
  final List<SubscriptionResultBase> items;
  SubscriptionResult(this.items);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // padding: const EdgeInsets.all(8),
        children: this.items,
        //shrinkWrap: true,
      ),
    );
  }
}
