import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_screen.dart';
import 'package:cs310insta/ui/subscription_screen/subscription_viewmodel.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';

class SubscriptionBar extends StatelessWidget {
  //const NotificationScreen({Key key}) : super(key: key);
  //
  //

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // void _openEndDrawer() {
    //   _scaffoldKey.currentState!.openEndDrawer();
    // }

    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<SubscriptionViewModel>.reactive(
      viewModelBuilder: () => SubscriptionViewModel(),
      builder: (context, model, child) => Scaffold(
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
                              model.setmyIndex("locationsubs");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Topic",
                              style: subs_ButtonTextStyle,
                            ),
                            style: subs_ButtonStyle,
                            onPressed: () {
                              model.setmyIndex("topicsubs");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Followers",
                              style: subs_ButtonTextStyle,
                            ),
                            style: subs_ButtonStyle,
                            onPressed: () {
                              model.setmyIndex("followers");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Following",
                              style: subs_ButtonTextStyle,
                            ),
                            style: subs_ButtonStyle,
                            onPressed: () {
                              model.setmyIndex("following");
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
        ].elementAt(model.selectedIndex),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //model.pageWidget,
              [
                SubscriptionScreen(),
                //SearchResult(model.peoples),
                SubscriptionResult(model.locationsubs),
                SubscriptionResult(model.topicsubs),
                SubscriptionResult(model.followers),
                SubscriptionResult(model.following),
              ].elementAt(model.selectedIndex),
            ],
          ),
        ),
      ),
    );
  }
}
