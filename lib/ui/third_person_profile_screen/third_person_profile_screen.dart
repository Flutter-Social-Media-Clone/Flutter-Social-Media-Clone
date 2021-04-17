import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';

class ThirdPersonProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_outlined),
        toolbarHeight: 350, // default is 56
        //toolbarOpacity: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // title: Text('Profile'),
        bottom: PreferredSize(
          preferredSize: Size(100, 100),
          child: ThirdPersonAppBar(),
        ),
      ),
      body: Container(
        child: Center(
          child: Text("aaaa"),
        ),
      ),
    );
  }
}

class ThirdPersonAppBar extends StatelessWidget {
  const ThirdPersonAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            height: 350.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 34.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          OutlinedButton(
                              child: Text(
                                "Remove",
                                style: profileButtonTextStyle,
                              ),
                              style: profileButtonStyle,
                              onPressed: () {}),
                        ],
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://img-s1.onedio.com/id-5d2ef7db3810d17123d5122c/rev-0/w-635/listing/f-jpg-webp/s-28249b47a72289a187b15a1dfc011ddedc8e0ab0.webp",
                            ),
                            radius: 50.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.bookmark_outline),
                              iconSize: 35,
                              color: Colors.white,
                              onPressed: () {}),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.favorite_outline),
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
                                            "Posts",
                                            style: login_signupButtonTextStyle,
                                          ),
                                          style: login_signupButtonStyle,
                                          onPressed: () {}),
                                      OutlinedButton(
                                        child: Text(
                                          "Photos",
                                          style: login_signupButtonTextStyle,
                                        ),
                                        style: login_signupButtonStyle,
                                        onPressed: () {},
                                      ),
                                      OutlinedButton(
                                        child: Text(
                                          "Location",
                                          style: login_signupButtonTextStyle,
                                        ),
                                        style: login_signupButtonStyle,
                                        onPressed: () {},
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
    );
  }
}
