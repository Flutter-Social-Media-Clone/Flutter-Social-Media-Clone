import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:cs310insta/core/state/thirdpersonprofile_state.dart';
import 'package:flutter_button/custom/like_button.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
// class ThirdPersonProfileScreen extends ViewModelWidget<ThirdPersonViewModel> {
//   @override
//   Widget build(BuildContext context, ThirdPersonViewModel model) {
//     return Container(
//
//
//
// class WrapSearch extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<SearchViewModel>.reactive(
//       viewModelBuilder: () => SearchViewModel(),

class ThirdPersonProfileScreen extends StatelessWidget {
  final ThirdPersonProfileState thirdpersonProfileState =
      Get.put(ThirdPersonProfileState());
  final MyAuth myAuth = Get.put(MyAuth());

  @override
  Widget build(BuildContext context) {
    //myAnalytics.mySetCurrentScreen("third person screen");
    thirdpersonProfileState.getUserData();
    return Scaffold(
      backgroundColor: feedBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(100, 330),
        child: ThirdPersonAppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            ThirdPersonBody(),
          ],
        ),
      ),
    );
  }
}

// class MyProfileBody extends ViewModelWidget<MainAppViewModel> {
//   @override
//   Widget build(BuildContext context, MainAppViewModel model) {

class ThirdPersonAppBar extends StatelessWidget {
  final ThirdPersonProfileState thirdPersonProfileState =
      Get.put(ThirdPersonProfileState());
  final firestoreInstance = FirebaseFirestore.instance;
  final MyAuth myAuth = Get.put(MyAuth());
  final MyFirestore myFirestore = Get.put(MyFirestore());
  final MessageState messageState = Get.put(MessageState());
  final MyProfileState myProfileState = Get.put(MyProfileState());
  bool isBookmarked;
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
              ],
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 360.0,
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
                          Obx(
                            () => OutlinedButton(
                                child: Text(
                                  thirdPersonProfileState.getIsRemoveOrAdd(),
                                  style: profileButtonTextStyle,
                                ),
                                style: profileButtonStyle,
                                onPressed: () {
                                  thirdPersonProfileState
                                      .handleAddRemoveFriend();
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Column(
                        children: [
                          Obx(
                            () => CircleAvatar(
                              backgroundImage: NetworkImage(
                                (thirdPersonProfileState
                                    .userData.value)["imgUrl"],
                              ),
                              radius: 50.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          LikeButton(
                            icon: Icons.bookmark_outlined,
                            deactiveColor: Colors.white,
                            activeColor: Colors.black,
                            deactiveSize: 30,
                            activeSize: 35,
                            curve: Curves.easeInExpo,
                            onTap: () async {
                              isBookmarked = true;
                              if (isBookmarked == true) {
                                firestoreInstance.collection("bookmarks").add({
                                  "username": myAuth.getCurrentUser(),
                                  "bookmarked":
                                      thirdPersonProfileState.thirdUserId.value,
                                }).then((_) {
                                  print("Bookmarked");
                                });
                                var username_thirdperson = await myFirestore
                                    .getUserName(thirdPersonProfileState
                                        .thirdUserId.value);
                                var username_current = await myFirestore
                                    .getUserName(myAuth.getCurrentUser());
                                await myFirestore.addNotification(
                                    thirdPersonProfileState.thirdUserId.value,
                                    "${username_current} bookmarked you!");
                                await myFirestore.addNotification(
                                    myAuth.getCurrentUser(),
                                    "You bookmarked ${username_thirdperson}!");
                              } else if (isBookmarked == false) {
                                myFirestore.deleteBookmark(
                                    myAuth.getCurrentUser(),
                                    thirdPersonProfileState.thirdUserId.value);

                                print("Unbookmarked");
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FavoriteButton(
                            isFavorite: false,
                            iconDisabledColor: Colors.white,
                            valueChanged: (_isFavorite) async {
                              if (_isFavorite == true) {
                                firestoreInstance
                                    .collection("Liked")
                                    .doc()
                                    .set({
                                  "username": myAuth.getCurrentUser(),
                                  "liked":
                                      thirdPersonProfileState.thirdUserId.value,
                                }).then((_) {
                                  print("Liked");
                                  print('Is Favourite $_isFavorite');
                                });
                                var username_thirdperson = await myFirestore
                                    .getUserName(thirdPersonProfileState
                                        .thirdUserId.value);
                                var username_current = await myFirestore
                                    .getUserName(myAuth.getCurrentUser());
                                await myFirestore.addNotification(
                                    thirdPersonProfileState.thirdUserId.value,
                                    "${username_current} like you!");
                                await myFirestore.addNotification(
                                    myAuth.getCurrentUser(),
                                    "You like ${username_thirdperson}!");
                                //await addNotification(thirdPersonProfileState.thirdUserId.value, "You added ${thirdPersonProfileState.thirdUserId.value} as friend.");
                              } else if (_isFavorite == false) {
                                myFirestore.deleteLike(myAuth.getCurrentUser(),
                                    thirdPersonProfileState.thirdUserId.value);

                                print("UnLiked");
                                print('Is Favourite $_isFavorite');
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Obx(
                    () => Text(
                      (thirdPersonProfileState.userData.value)["username"],
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full:
                            Image(image: AssetImage('assets/images/heart.png')),
                        half: Image(
                            image: AssetImage('assets/images/heart_half.png')),
                        empty: Image(
                            image:
                                AssetImage('assets/images/heart_border.png'))),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                              child: Text(
                                "comments",
                                style: profileButtonTextStyle,
                              ),
                              style: profileButtonStyle,
                              onPressed: () {
                                Navigator.pushNamed(context, "/comments");
                              }),
                          OutlinedButton(
                              child: Text(
                                "Send Message",
                                style: profileButtonTextStyle,
                              ),
                              style: hiddenprofile_ButtonStyle,
                              onPressed: () {
                                print(
                                    "\n\n\n\n\n\n\n\n thirdPersonProfileScreeen 217" +
                                        thirdPersonProfileState
                                            .thirdUserId.value);
                                print(
                                    "\n\n\n\n\n\n\n\n thirdPersonProfileScreeen 218" +
                                        myAuth.getCurrentUser());
                                print("\n\n\n\n\n\n\n\n.");
                                messageState.setmyConv(
                                    thirdPersonProfileState.thirdUserId.value);
                                messageState.setmyConv2(
                                    thirdPersonProfileState
                                        .userData.value["username"],
                                    thirdPersonProfileState
                                        .userData.value["imgUrl"]);
                                myFirestore.createConv(
                                  thirdPersonProfileState.thirdUserId.value,
                                  myAuth.getCurrentUser(),
                                  thirdPersonProfileState
                                      .userData.value["imgUrl"],
                                  thirdPersonProfileState
                                      .userData.value["username"],
                                );
                                Navigator.pushNamed(
                                  context,
                                  "/messageSingle",
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    clipBehavior: Clip.antiAlias,
                    color: Color.fromRGBO(18, 52, 86, 1.0),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
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
                                          onPressed: () {
                                            thirdPersonProfileState
                                                .setmyIndex("posts");
                                          }),
                                      OutlinedButton(
                                        child: Text(
                                          "Photos",
                                          style: login_signupButtonTextStyle,
                                        ),
                                        style: login_signupButtonStyle,
                                        onPressed: () {
                                          thirdPersonProfileState
                                              .setmyIndex("medias");
                                        },
                                      ),
                                      OutlinedButton(
                                        child: Text(
                                          "Location",
                                          style: login_signupButtonTextStyle,
                                        ),
                                        style: login_signupButtonStyle,
                                        onPressed: () {
                                          thirdPersonProfileState
                                              .setmyIndex("locations");
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
    );
  }
}

class ThirdPersonBody extends StatelessWidget {
  final ThirdPersonProfileState thirdPersonProfileState =
      Get.put(ThirdPersonProfileState());

  @override
  Widget build(BuildContext context) {
    thirdPersonProfileState.getUserMedias();
    thirdPersonProfileState.getUserPosts();

    return Obx(
      () => Posts(
        thirdPersonProfileState.getMyResults(),
      ),
    );
  }
}

//  if(isBookmarked==false){
//         firestoreInstance
//         .collection("bookmarks")
//         .add({
//       "username": myAuth.getCurrentUser(),
//       "bookmarked":  thirdPersonProfileState.thirdUserId.value,
//     }) .then((_) {
//       print("BOOKMARK");
//       isBookmarked = true;
//     }),
//  }
//   else if(isBookmarked == true){
//       myFirestore.deleteBookmark(myAuth.getCurrentUser(), thirdPersonProfileState.thirdUserId.value);
//       print("UNBOOKMARK");
//       isBookmarked = false;
//     }
