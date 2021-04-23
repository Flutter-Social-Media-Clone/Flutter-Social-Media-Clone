import 'package:flutter/material.dart';

abstract class User extends StatelessWidget {
  final String id;
  final NetworkImage profileImage;
  final String username;
  final String name;
  final String surname;
  final String age;
  final String gender;
  final String starCount;
  final List<User> followers;
  final List<User> following;
  final List<String> comments;

  User({
    this.id,
    this.profileImage,
    this.username,
    this.name,
    this.surname,
    this.age,
    this.gender,
    this.starCount,
    this.followers,
    this.following,
    this.comments,
  });
}
