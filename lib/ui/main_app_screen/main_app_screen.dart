import 'package:cs310insta/core/models/bottom_bar.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/components/RightDrawer/right_drawer.dart';
import 'package:cs310insta/ui/feed_screen/feed_screen.dart';
import 'package:cs310insta/ui/my_profile_screen/my_profile_screen.dart';
import 'package:cs310insta/ui/notification_screen/notification_screen.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
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
            toolbarHeight: 120, // default is 56
            //toolbarOpacity: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Search'),
            bottom: PreferredSize(
              preferredSize: Size(100, 140),
              child: Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  cursorColor: Colors.pinkAccent,
                  decoration: InputDecoration(
                    hintText: 'Search ',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (text) {
                    text = text.toLowerCase();
                  },
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
                                child: Icon(Icons.dehaze),
                              ),
                              SizedBox(height: 80)
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //model.pageWidget,
              [
                WrapSearch(),
                //SearchResult(model.peoples),
                ImagePostList(),
                SearchResult(model.locations),
                NotificationScreen(),
                MyProfileBody(),
              ].elementAt(model.selectedIndex),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
        endDrawer: [null, null, null, null, RightDrawer()]
            .elementAt(model.selectedIndex),
      ),
    );
  }
}
