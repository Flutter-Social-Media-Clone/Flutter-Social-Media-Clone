import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ShareState extends GetxController {
  var myShareIndex = "media".obs;

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
  }

  void removeImage() {
    _image.value = PickedFile("");
  }
}
