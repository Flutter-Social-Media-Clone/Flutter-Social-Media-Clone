import 'package:cs310insta/core/models/bottom_bar.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/components/RightDrawer/right_drawer.dart';
import 'package:cs310insta/ui/feed_screen/feed_screen.dart';
import 'package:cs310insta/ui/my_profile_screen/my_profile_screen.dart';
import 'package:cs310insta/ui/notification_screen/notification_screen.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:cs310insta/ui/share_screen/share_screen.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';
import 'main_app_viewmodel.dart';

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

    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<MainAppViewModel>.reactive(
      viewModelBuilder: () => MainAppViewModel(),
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: feedBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: [
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 125, // default is 56
            //toolbarOpacity: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                              model.setMode("peoples");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Topic",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              model.setMode("topics");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Location",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              model.setMode("locations");
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Feed'),
          ),
          AppBar(
            // leading: Icon(Icons.arrow_back_outlined),
            toolbarHeight: 125, // default is 56
            //toolbarOpacity: 1,
            title: Text('Share'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
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
                              model.setShareIndex("media");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Post",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              model.setShareIndex("post");
                            },
                          ),
                          OutlinedButton(
                            child: Text(
                              "Location",
                              style: login_signupButtonTextStyle,
                            ),
                            style: login_signupButtonStyle,
                            onPressed: () {
                              model.setShareIndex("location");
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
                                  onPressed: () {}),
                            ),
                            SizedBox(
                              height: 80,
                            )
                          ],
                        ),
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
                    MyProfileAppBar(),
                  ],
                ),
              )),
        ].elementAt(model.selectedIndex),
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
            ].elementAt(model.selectedIndex),
          ],
        ),
        bottomNavigationBar: BottomBar(),
        endDrawer: [null, null, null, null, RightDrawer()]
            .elementAt(model.selectedIndex),
      ),
    );
  }
}
