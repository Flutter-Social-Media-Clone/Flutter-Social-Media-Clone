import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ShareState extends GetxController {
  var storage = FirebaseStorage.instance;
  var myShareIndex = "media".obs;
  File _imageFile;
  void setShareIndex(var index) {
    myShareIndex.value = index;
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
