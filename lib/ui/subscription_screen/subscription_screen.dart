import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatelessWidget {
  final SubscriptionState mySubscriptionState = Get.put(SubscriptionState());
  final MyAuth myAuth = Get.put(MyAuth());

  @override
  Widget build(BuildContext context) {
    mySubscriptionState.getFollowers(myAuth.getCurrentUser());
    mySubscriptionState.getFollowing(myAuth.getCurrentUser());

    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Obx(
              () => SubscriptionResult(
                mySubscriptionState.getSubscriptionResult(),
              ),
            ),
          ],
        ),
      ),

      // Container(
      //   child: SearchResult(model.peoples),
      // );
    );
  }
}
