import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_viewmodel.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SubscriptionScreen extends ViewModelWidget<SubscriptionViewModel> {
  @override
  Widget build(BuildContext context, SubscriptionViewModel model) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            SubscriptionResult(
              model.getSubscriptionResult(),
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
