import 'dart:ui';

import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/ui/search_screen/search_viewmodel.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ShareScreen extends ViewModelWidget<MainAppViewModel> {
  @override
  Widget build(BuildContext context, MainAppViewModel model) {
    return model.getShareResults();

    // Container(
    //   child: SearchResult(model.peoples),
    // );
  }
}

class PostImage extends ViewModelWidget<MainAppViewModel> {
  @override
  Widget build(BuildContext context, MainAppViewModel model) {
    return Expanded(
      child: model.image != null
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.close,
                          size: 44,
                        ),
                        onTap: model.removeImage,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: ClipRRect(
                    child: Image.file(
                      model.image,
                      height: 600,
                      width: 400,
                    ),
                  ),
                ),
              ],
            )
          : Container(
              margin: EdgeInsets.all(30.0),
              decoration: BoxDecoration(color: Colors.grey[500]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Select image or take one!",
                      style: walkthroughScreenSubHeader,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      child: Text(
                        "Load Camera",
                        style: hiddenprofile_ButtonTextStyle,
                      ),
                      onPressed: model.imgFromCamera,
                      style: hiddenprofile_ButtonStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      child: Text(
                        "Load Galery",
                        style: hiddenprofile_ButtonTextStyle,
                      ),
                      onPressed: model.imgFromGallery,
                      style: hiddenprofile_ButtonStyle,
                    ),
                  ),
                ],
              ),
              height: 600,
              width: 400,
            ),
    );

    // Container(
    //   child: SearchResult(model.peoples),
    // );
  }
}

class PostPost extends ViewModelWidget<MainAppViewModel> {
  @override
  Widget build(BuildContext context, MainAppViewModel model) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: TextField(
        maxLength: 140,
        style: TextStyle(
          fontSize: 25,
        ),
        cursorColor: Colors.pink,
        cursorWidth: 3,
        cursorHeight: 25,
        decoration: new InputDecoration(
          counterStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.pink, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),

        keyboardType: TextInputType.multiline,
        minLines: 6, //Normal textInputField will be displayed
        maxLines: 6, // when user presses enter it will adapt to it
      ),
    );
  }
}
