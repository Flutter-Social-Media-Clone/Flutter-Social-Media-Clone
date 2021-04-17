import 'package:cs310insta/core/models/bottom_bar.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
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
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<MainAppViewModel>.reactive(
      viewModelBuilder: () => MainAppViewModel(),
      builder: (context, model, child) => Scaffold(
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
            preferredSize: Size(100, 280),
            child: MyProfileAppBar(),
          ),
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
      ),
    );
  }
}
