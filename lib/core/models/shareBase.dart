import 'package:cs310insta/utils/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';

abstract class ShareBase extends StatelessWidget {}

class MediaShare extends ShareBase {
  final File image;
  final Function galleryPicker;
  final Function cameraPicker;

  MediaShare({
    this.image,
    this.galleryPicker,
    this.cameraPicker,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
