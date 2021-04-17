import 'package:cs310insta/core/models/userBase.dart';
import 'package:flutter/material.dart';

abstract class Location extends StatelessWidget {
  final String id;
  final User user;

  Location({
    this.id,
    this.user,
  });
}
