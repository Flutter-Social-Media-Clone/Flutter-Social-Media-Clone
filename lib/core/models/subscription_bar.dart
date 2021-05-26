import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_screen.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:get/get.dart';

class SubscriptionBar extends StatelessWidget {
  //const NotificationScreen({Key key}) : super(key: key);
  //
  //
  final SubscriptionState mySubscriptionState = Get.put(SubscriptionState());
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // void _openEndDrawer() {
    //   _scaffoldKey.currentState!.openEndDrawer();
    // }

    // ViewModelBuilder is what provides the view model to the widget tree.
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: feedBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: [
        AppBar(
          toolbarHeight: 80, // default is 56
          //toolbarOpacity: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          bottom: PreferredSize(
            preferredSize: Size(100, 100),
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 15),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.arrow_back_outlined,
                            size: 35, color: Colors.white),
                        OutlinedButton(
                          child: Text(
                            "Location",
                            style: subs_ButtonTextStyle,
                          ),
                          style: subs_ButtonStyle,
                          onPressed: () {
                            mySubscriptionState.setmyIndex("locationsubs");
                          },
                        ),
                        OutlinedButton(
                          child: Text(
                            "Topic",
                            style: subs_ButtonTextStyle,
                          ),
                          style: subs_ButtonStyle,
                          onPressed: () {
                            mySubscriptionState.setmyIndex("topicsubs");
                          },
                        ),
                        OutlinedButton(
                          child: Text(
                            "Followers",
                            style: subs_ButtonTextStyle,
                          ),
                          style: subs_ButtonStyle,
                          onPressed: () {
                            mySubscriptionState.setmyIndex("followers");
                          },
                        ),
                        OutlinedButton(
                          child: Text(
                            "Following",
                            style: subs_ButtonTextStyle,
                          ),
                          style: subs_ButtonStyle,
                          onPressed: () {
                            mySubscriptionState.setmyIndex("following");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ].elementAt(mySubscriptionState.selectedIndex.value),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //model.pageWidget,
            [
              SubscriptionScreen(),
              //SearchResult(model.peoples),
              SubscriptionResult(mySubscriptionState.locationsubs),
              SubscriptionResult(mySubscriptionState.topicsubs),
              SubscriptionResult(mySubscriptionState.followers),
              SubscriptionResult(mySubscriptionState.following),
            ].elementAt(mySubscriptionState.selectedIndex.value),
          ],
        ),
      ),
    );
  }
}
