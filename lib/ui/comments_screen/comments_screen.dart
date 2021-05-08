import 'package:cs310insta/core/models/bottom_bar.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cs310insta/utils/style.dart';
import '../components/commentsCard/comments_card.dart';
import '../components/commentsCard/comments_card_viewmodel.dart';
import 'comments_viewmodel.dart';
import 'dart:async';
import 'dart:math';
import 'dart:convert';
import '../../core/models/cardModel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// visit https://protocoderspoint.com/flutter-refresh-indicator-a-pull-to-refresh-listview-with-example/ for pull refresh
//
class CommentsScreen extends StatelessWidget {
  String comment;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: feedBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(340, 230),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          toolbarHeight: 220,
          title: Column(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://img-s1.onedio.com/id-5d2ef7db3810d17123d5122c/rev-0/w-635/listing/f-jpg-webp/s-28249b47a72289a187b15a1dfc011ddedc8e0ab0.webp",
                  ),
                  radius: 70.0,
                ),
              ),
              Text("comments to Jane"),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add Comment"),
                      backgroundColor: Colors.white,
                      content: Container(
                        height: 400,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://img-s1.onedio.com/id-5d2ef7db3810d17123d5122c/rev-0/w-635/listing/f-jpg-webp/s-28249b47a72289a187b15a1dfc011ddedc8e0ab0.webp",
                                ),
                                radius: 50.0,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RatingBar(
                                initialRating: 3,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                    full: Image(
                                        image: AssetImage(
                                            'assets/images/heart.png')),
                                    half: Image(
                                        image: AssetImage(
                                            'assets/images/heart_half.png')),
                                    empty: Image(
                                        image: AssetImage(
                                            'assets/images/heart_border.png'))),
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 150,
                                child: TextFormField(
                                  // onSubmitted: (e) {
                                  //   print(e);
                                  // },
                                  onSaved: (e) {
                                    comment = e;
                                  },
                                  maxLength: 140,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  cursorColor: Colors.pink,
                                  cursorWidth: 3,
                                  cursorHeight: 18,
                                  decoration: new InputDecoration(
                                    counterStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 3.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.pink, width: 3.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),

                                  keyboardType: TextInputType.multiline,
                                  minLines:
                                      6, //Normal textInputField will be displayed
                                  maxLines:
                                      6, // when user presses enter it will adapt to it
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: Icon(Icons.add, size: 80),
                                    onTap: () => {
                                      if (_formKey.currentState.validate())
                                        {_formKey.currentState.save()},
                                      if (true) {print(comment)}
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.add,
                size: 40,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: CommentsList(),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  List<CommentsModel> commentsList = List.generate(
      Random().nextInt(15),
      (i) => CommentsModel(
          commentId: 1,
          date: "$i h ago",
          pp_url: "asdsda",
          commentText: "notification $i",
          name: "deneme"));
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 5),
        dragStartBehavior: DragStartBehavior.start,
        addSemanticIndexes: true,
        children: commentsList
            .map((commentSingle) => CommentsCard(
                  commentBody: commentSingle,
                ))
            .toList(),
      ),
    );
  }
}
