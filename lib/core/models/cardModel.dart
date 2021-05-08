import 'package:flutter/material.dart';

class NotificationModel {
  int id;
  String image_url;
  String notification;
  String date;
  NotificationModel({this.id, this.image_url, this.notification, this.date});
}

class MessageModel {
  String from;
  String message;
  String img;
  bool is_read;
  MessageModel({this.from, this.message, this.img, this.is_read});
}

class CommentsModel {
  int commentId;
  String pp_url;
  String name;
  String commentText;
  String date;
  CommentsModel(
      {this.commentId, this.pp_url, this.name, this.commentText, this.date});
}
