import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              height: 310.0,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 34.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            OutlinedButton(
                                child: Text(
                                  "Subscription",
                                  style: profile_ButtonTextStyle,
                                ),
                                style: profile_ButtonStyle,
                                onPressed: () {}),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://img-s1.onedio.com/id-5d2ef7db3810d17123d5122c/rev-0/w-635/listing/f-jpg-webp/s-28249b47a72289a187b15a1dfc011ddedc8e0ab0.webp",
                              ),
                              radius: 70.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(Icons.menu),
                                iconSize: 35,
                                color: Colors.white,
                                onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
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
                      color: Color.fromRGBO(18, 52, 86, 1.0),
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
                                                "Location",
                                                style:
                                                    login_signupButtonTextStyle,
                                              ),
                                              style: login_signupButtonStyle,
                                              onPressed: () {}),
                                          OutlinedButton(
                                            child: Text(
                                              "Topic",
                                              style:
                                                  login_signupButtonTextStyle,
                                            ),
                                            style: login_signupButtonStyle,
                                            onPressed: () {},
                                          ),
                                          OutlinedButton(
                                            child: Text(
                                              "People",
                                              style:
                                                  login_signupButtonTextStyle,
                                            ),
                                            style: login_signupButtonStyle,
                                            onPressed: () {},
                                          ),
                                        ]),
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
