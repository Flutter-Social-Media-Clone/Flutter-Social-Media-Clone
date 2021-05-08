import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';

class UnreadIcon extends StatelessWidget {
  final bool is_read;
  UnreadIcon({this.is_read});
  @override
  Widget build(BuildContext context) {
    if (this.is_read) {
      return SizedBox(
        height: 40,
        child: Icon(
          Icons.lens,
          color: bottomNavBackgroundColor,
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
