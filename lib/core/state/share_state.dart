import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/core/state/auth.dart';
import 'package:cs310insta/core/state/fireStore_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ShareState extends GetxController {
  final formKey = GlobalKey<FormState>();
  final topicKey = GlobalKey<FormState>();

  var postText = "".obs;

  var storage = FirebaseStorage.instance;
  MyFirestore myFirestore = Get.put(MyFirestore());
  MyAuth myAuth = Get.put(MyAuth());

  var myShareIndex = "media".obs;
  File _imageFile;
  void setShareIndex(var index) {
    print("--->" + index);
    myShareIndex.value = index;
  }

  KFormField topicField1 = new KFormField(
    keyboardType: TextInputType.text,
    hint: "Topic 1",
  );
  KFormField topicField2 = new KFormField(
    keyboardType: TextInputType.text,
    hint: "Topic 2",
  );
  KFormField topicField3 = new KFormField(
    keyboardType: TextInputType.text,
    hint: "Topic 3",
  );
  var topic1 = "".obs;
  var topic2 = "".obs;
  var topic3 = "".obs;

  handleSaveTopic1(value) {
    topic1.value = value;
  }

  handleSaveTopic2(value) {
    topic2.value = value;
  }

  handleSaveTopic3(value) {
    topic3.value = value;
  }

  void handleSavePostText(var value) {
    postText.value = value;
  }

  void handleSharePost() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      if (topicKey.currentState.validate()) {
        topicKey.currentState.save();
        print(postText.value);
        print(topic1.value);
        print(topic2.value);
        print(topic3.value);

        myFirestore.sharePost(
            postText.value,
            [topic1.value, topic2.value, topic3.value],
            myAuth.getCurrentUser());
      }
    }
  }

  void handleShareImage() async {
    if (topicKey.currentState.validate()) {
      topicKey.currentState.save();
      print(_image);
      print(postText.value);
      print(topic1.value);
      print(topic2.value);
      print(topic3.value);
      File _imageFile;
      _imageFile = File(_image.value.path);

      // final byteData = await rootBundle.load(_image.value.path);
      // var s = await _imageFile.writeAsBytes(byteData.buffer
      //     .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      var uuid = Uuid();

      print("par1");
      // print(s);
      print("par2");
      TaskSnapshot snapshot = await storage
          .ref()
          .child("postPhotos/${uuid.v4()}")
          .putFile(_imageFile);
      print("par3");

      if (snapshot.state == TaskState.success) {
        var downloadUrl = await snapshot.ref.getDownloadURL();
        myFirestore.shareImagePost(
            downloadUrl,
            [topic1.value, topic2.value, topic3.value],
            myAuth.getCurrentUser());
      } else {
        print("par4");
      }
    }
  }

  void handleWrapper() async {
    print("---------------");
    print(myShareIndex.value);
    print(_image.value.path.length == 0);
    // TODO: bura çalışmıyor post share ederiken mediadaki öğe silinmediyse
    print("------------");
    if (myShareIndex.value == "post") {
      handleSharePost();
    } else {
      handleShareImage();
    }
    //Get.toNamed("/mainapp");
  }

  var _image = PickedFile("").obs;

  File getImage() {
    if (_image.value.path != "") {
      return File(_image.value.path);
    } else {
      return null;
    }
  }

  final _picker = ImagePicker();

  void imgFromCamera() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    _image.value = image;
  }

  void imgFromGallery() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    _image.value = image;
    print("asdsad");
    print(image.path);
    addImage2Storage(image);
  }

  void removeImage() {
    _image.value = PickedFile("");
  }

  void addImage2Storage(PickedFile image) async {
    _imageFile = File(image.path);
    final byteData = await rootBundle.load(image.path);
    await _imageFile.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    TaskSnapshot snapshot =
        await storage.ref().child("images/deneme.jpg").putFile(_imageFile);
    if (snapshot.state == TaskState.success) {
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection("images")
          .add({"url": downloadUrl, "name": "deneme.jpg"});
    }
  }
}
