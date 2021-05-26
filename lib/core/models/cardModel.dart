import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationModel {
  int id;
  String image_url;
  String notification;
  Timestamp timestamp;
  NotificationModel(
      {this.id, this.image_url, this.notification, this.timestamp});
}

class MessageModel {
  String from;
  String message;
  String img;
  bool is_read;
  String fromUid;
  Timestamp timestamp;
  String docId;
  String toUsername;
  MessageModel(
      {this.from,
      this.message,
      this.img,
      this.is_read,
      this.fromUid,
      this.timestamp,
      this.docId,
      this.toUsername});
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
