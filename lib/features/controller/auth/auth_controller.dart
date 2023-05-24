import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthController extends GetxController {
  pickImage();
  showPassword();
  showConfirmPassword();
}

class AuthControllerImpl extends AuthController {
  File? image;
  bool isShowPassword = true;
  bool isShowConfirmNewPassword = true;

  @override
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);

      this.image = imageTemporary;
      update();
    } on PlatformException catch (error) {
      log("Failed to Pick Image we need permission to access phone files ! : $error");
    }
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  showConfirmPassword() {
    isShowConfirmNewPassword = isShowConfirmNewPassword == true ? false : true;
    update();
  }
}
