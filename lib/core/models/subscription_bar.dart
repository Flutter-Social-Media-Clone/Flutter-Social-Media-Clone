import 'package:cs310insta/core/models/subscriptionResultBase.dart';
import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
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
                          size: 35,
                          color: Colors.white),
                          OutlinedButton(
                            child: Text(
                              "Location",
                              style: subs_signupButtonTextStyle,
                              
                            ),
                            style: subs_signupButtonStyle,
                            onPressed: () {
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Topic",
                              style: subs_signupButtonTextStyle,
                            ),
                            style: subs_signupButtonStyle,
                            onPressed: () {
                            },
                          ),                          
                          OutlinedButton(
                            child: Text(
                              "Followers",
                             style: subs_signupButtonTextStyle,
                            ),
                            style: subs_signupButtonStyle,
                            onPressed: () {
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Following",
                              style: subs_signupButtonTextStyle,
                            ),
                            style: subs_signupButtonStyle,
                            onPressed: () {
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
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 76, // default is 56
            //toolbarOpacity: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Feed'),
          ),
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 76, // default is 56
            //toolbarOpacity: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Share'),
          ),
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 76, // default is 56
            //toolbarOpacity: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Notifications'),
          ),

          PreferredSize(
              preferredSize: Size(340, 320),
              child: Container(
                child: Column(
                  children: [
                    AppBar(
                      toolbarHeight: 180,
                      automaticallyImplyLeading: false,
                      backgroundColor: bottomNavBackgroundColor,
                      leadingWidth: 110,
                      leading: Container(
                        height: 180,
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                      title: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://img-s1.onedio.com/id-5d2ef7db3810d17123d5122c/rev-0/w-635/listing/f-jpg-webp/s-28249b47a72289a187b15a1dfc011ddedc8e0ab0.webp",
                            ),
                            radius: 70.0,
                          ),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 70),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () =>
                                    {_scaffoldKey.currentState.openEndDrawer()},
                                child: Icon(
                                  Icons.dehaze,
                                  size: 40,
                                ),
                              ),
                              SizedBox(height: 60)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ].elementAt(model.selectedIndex),          
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //model.pageWidget,
              [
                SubscriptionScreen(),
                //SearchResult(model.peoples),
                SubscriptionResult(model.followers),
                SubscriptionResult(model.following),
                SubscriptionResult(model.topicsubs),
                SubscriptionResult(model.locationsubs),
              ].elementAt(model.selectedIndex),
            ],
          ),
        ),

    ),
    );
  }
}