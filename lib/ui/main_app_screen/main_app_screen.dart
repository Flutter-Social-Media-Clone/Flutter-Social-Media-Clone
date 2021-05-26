import 'package:cs310insta/core/models/bottom_bar.dart';
import 'package:cs310insta/core/state/analytics.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/ui/components/RightDrawer/right_drawer.dart';
import 'package:cs310insta/ui/feed_screen/feed_screen.dart';
import 'package:cs310insta/ui/my_profile_screen/my_profile_screen.dart';
import 'package:cs310insta/ui/notification_screen/notification_screen.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:cs310insta/ui/share_screen/share_screen.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cs310insta/utils/style.dart';

class MainAppScreen extends StatelessWidget {
  //const NotificationScreen({Key key}) : super(key: key);
  //
  //

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // void _openEndDrawer() {
    //   _scaffoldKey.currentState!.openEndDrawer();
    // }
    final MyProfileState myProfileState = Get.put(MyProfileState());
    myProfileState.getUserData();
    final SearchState searchState = Get.put(SearchState());
    final ShareState shareState = Get.put(ShareState());
    final BottomNavigationState bottomNavigationState =
        Get.put(BottomNavigationState());

    final MyAnalytics myAnalytics = Get.put(MyAnalytics());

    myAnalytics.mySetCurrentScreen("main app screen");
    myProfileState.getUserData();

    // MyFirestore myFirestore = Get.put(MyFirestore());
    MyAuth myAuth = Get.put(MyAuth());
    // myFirestore.getFeed(myAuth.getCurrentUser());
    final FeedState feedState = Get.put(FeedState());
    feedState.getMyFeed(myAuth.getCurrentUser());
    // final MyAuth myAuth = Get.put(MyAuth());

    // String a = myAuth.getCurrentUser();

    // print("AAAAAAAAAAAAAA    " + a);

    // ViewModelBuilder is what provides the view model to the widget tree.
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        backgroundColor: feedBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: [
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 125, // default is 56
            //toolbarOpacity: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            bottom: PreferredSize(
              preferredSize: Size(100, 100),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    TextField(
                      cursorColor: Colors.pinkAccent,
                      decoration: InputDecoration(
                        hintText: 'Search ',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      onChanged: (text) {
                        searchState.getPeopleForSearch(text.toLowerCase());
                        searchState.getTopicForSearch(text.toLowerCase());
                        text = text.toLowerCase();
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          OutlinedButton(
                            child: Text(
                              "People",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              searchState.setMode("peoples");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Topic",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              searchState.setMode("topics");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Location",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              searchState.setMode("locations");
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

          // AppBar(
          //   // leading: Icon(Icons.arrow_back_outlined),
          //   toolbarHeight: 76, // default is 56
          //   //toolbarOpacity: 1,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //   title: Text('Search'),
          // ),
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 76, // default is 56
            //toolbarOpacity: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            title: Text('Feed'),
            actions: [
              InkWell(
                onTap: () => {Navigator.pushNamed(context, "/message")},
                child: Icon(
                  Icons.send,
                  size: 40,
                ),
              ),
            ],
          ),
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 125, // default is 56
            //toolbarOpacity: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            title: Text('Share'),

            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => {
                    Navigator.pushNamed(
                      context,
                      "/selectTopics",
                    ),
                  },
                  child: Icon(
                    Icons.navigate_next,
                    size: 40,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(100, 100),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          OutlinedButton(
                            child: Text(
                              "Media",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              shareState.setShareIndex("media");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Post",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              shareState.setShareIndex("post");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Location",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              shareState.setShareIndex("location");
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            title: Text(
              'Notifications for ${myProfileState.userData.value["username"]}',
            ),
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: OutlinedButton(
                                  child: Text(
                                    "Subscript",
                                    style: profileButtonTextStyle,
                                  ),
                                  style: profileButtonStyle,
                                  onPressed: () {
                                    Get.toNamed("/subscription");
                                  }),
                            ),
                            SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                      title: Column(
                        children: [
                          Obx(() =>
                              myProfileState.userData.value["imgUrl"] == null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.white38,
                                      backgroundImage: NetworkImage(
                                          "https://randomuser.me/api/portraits/women/4.jpg"),
                                      radius: 70,
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.white38,
                                      backgroundImage: NetworkImage(
                                        myProfileState.userData.value["imgUrl"],
                                      ),
                                      radius: 70,
                                    )),
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
                    MyProfileAppBar(),
                  ],
                ),
              )),
        ].elementAt(bottomNavigationState.selectedIndex.value),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //model.pageWidget,
            [
              WrapSearch(),
              //SearchResult(model.peoples),
              ImagePostList(),
              ShareScreen(),
              NotificationScreen(),
              MyProfileBody(),
            ].elementAt(bottomNavigationState.selectedIndex.value),
          ],
        ),
        bottomNavigationBar: BottomBar(),
        endDrawer: [null, null, null, null, RightDrawer()]
            .elementAt(bottomNavigationState.selectedIndex.value),
      ),
    );
  }
}
