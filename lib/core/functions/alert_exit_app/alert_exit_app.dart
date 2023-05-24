import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors/colors.dart';
import '../text_styles/text_styles.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "تنبيه !!!",
    titleStyle: textStyles(
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    middleText: "هل تريد الخروج من التطبيق",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text(
          "نعم",
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "لا",
        ),
      ),
    ],
  );
  return Future.value(true);
}
