import 'package:cs310insta/ui/subscription_screen/subscription_viewmodel.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_screen.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/$id",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: this.image,
                backgroundColor: Colors.grey[400],
                radius: 30,
              ),
              SizedBox(width: 30),
              Text(
                text,
                style: searchResultTextStyle,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/$id",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: this.image,
                backgroundColor: Colors.grey[400],
                radius: 30,
              ),
              SizedBox(width: 30),
              Text(
                text,
                style: searchResultTextStyle,
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
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "#$text",
                style: searchResultTextStyle,
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
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_pin),
              Text(
                "$text",
                style: searchResultTextStyle,
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

