import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  File? imageFile;
  String imageUpdateKey = "imageUpdatekey";
  pickUserProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imageFile = File(image.path);
      print("image.path: ${image.path}");
      update([imageUpdateKey]);
    }
  }
}
