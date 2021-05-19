import 'dart:ui';

import 'package:cs310insta/core/models/shareBase.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareScreen extends StatelessWidget {
  final ShareState shareState = Get.put(ShareState());

  @override
  Widget build(BuildContext context) {
    return (Obx(
      () => shareState.myShareIndex.value == "media"
          ? PostImage()
          : shareState.myShareIndex.value == "post"
              ? PostPost()
              : MediaShare(),
    ));

    // Container(
    //   child: SearchResult(model.peoples),
    // );
  }
}

class PostImage extends StatelessWidget {
  final ShareState shareState = Get.put(ShareState());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => shareState.getImage() != null
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
                          onTap: shareState.removeImage,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: ClipRRect(
                      child: Image.file(
                        shareState.getImage(),
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
                        onPressed: shareState.imgFromCamera,
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
                        onPressed: shareState.imgFromGallery,
                        style: hiddenprofile_ButtonStyle,
                      ),
                    ),
                  ],
                ),
                height: 600,
                width: 400,
              ),
      ),
    );

    // Container(
    //   child: SearchResult(model.peoples),
    // );
  }
}

class PostPost extends StatelessWidget {
  final ShareState myShareState = Get.put(ShareState());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Form(
        key: myShareState.formKey,
        child: Column(
          children: [
            TextFormField(
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
              onSaved: (value) {
                myShareState.handleSavePostText(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
