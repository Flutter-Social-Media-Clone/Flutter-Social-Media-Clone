import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/ui/my_profile_screen/my_profile_viewmodel.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyProfileAppBar extends ViewModelWidget<MainAppViewModel> {
  @override
  Widget build(BuildContext context, MainAppViewModel model) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(18, 52, 86, 1.0),
                      Color.fromRGBO(18, 52, 86, 1.0),
                    ])),
            child: Container(
              width: double.infinity,
              //height: 10.0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Jane Doe",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Color.fromRGBO(0, 0, 86, 0.0),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        OutlinedButton(
                                            child: Text(
                                              "Posts",
                                              style:
                                                  login_signupButtonTextStyle,
                                            ),
                                            style: login_signupButtonStyle,
                                            onPressed: () {
                                              model.setmyIndex("posts");
                                            }),
                                        OutlinedButton(
                                          child: Text(
                                            "Photos",
                                            style: login_signupButtonTextStyle,
                                          ),
                                          style: login_signupButtonStyle,
                                          onPressed: () {
                                            model.setmyIndex("medias");
                                          },
                                        ),
                                        OutlinedButton(
                                          child: Text(
                                            "Location",
                                            style: login_signupButtonTextStyle,
                                          ),
                                          style: login_signupButtonStyle,
                                          onPressed: () {
                                            model.setmyIndex("locations");
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyProfileBody extends ViewModelWidget<MainAppViewModel> {
  @override
  Widget build(BuildContext context, MainAppViewModel model) {
    return Posts(
      model.getMyResults(),
    );
  }
}
