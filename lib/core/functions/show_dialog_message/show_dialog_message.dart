import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/colors/colors.dart';
import '../../constant/constant.dart';

Future showDialogMessage({
  String? title,
  Widget? content,
  Widget? confirmButton,
  Widget? cancelButton,
}) {
  return Get.defaultDialog(
    title: title ?? "",
    content: content,
    backgroundColor: AppColors.whiteColor,
    contentPadding: EdgeInsets.symmetric(
      horizontal: AppConstant.appMarginTwentyTwo.h,
      vertical: AppConstant.appMarginTwentyTwo.w,
    ),
    radius: AppConstant.appRadius,
    confirm: confirmButton,
    cancel: cancelButton,
    titleStyle: Theme.of(Get.context!).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
    titlePadding: EdgeInsets.symmetric(
      horizontal: AppConstant.appMarginTwentyTwo.h,
      vertical: AppConstant.appMarginTwentyTwo.w,
    ),
  );
}
