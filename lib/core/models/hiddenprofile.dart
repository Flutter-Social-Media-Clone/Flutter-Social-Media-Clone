import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';

class HiddenProfileApp extends StatelessWidget {
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
              height: 320.0,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back_rounded),
                                iconSize: 35,
                                color: Colors.white,
                                onPressed: () {}),
                          ],
                        ),
                        SizedBox(width: 90, height: 210),
                        Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://tecake.com/wp-content/uploads/2020/12/chandler.jpg",
                                  ),
                                  radius: 70.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
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
                                              "Add",
                                              style:
                                                  hiddenprofile_ButtonTextStyle,
                                            ),
                                            style: hiddenprofile_ButtonStyle,
                                            onPressed: () {
                                              //TO DO: Change Text as "Waiting"
                                            },
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
