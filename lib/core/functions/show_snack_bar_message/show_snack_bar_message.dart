import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

import '../../constant/colors/colors.dart';
import '../../constant/constant.dart';

SnackbarController showSnackBarMessage({
  String? title,
  Text? titleText,
  String? message,
  String? messageText,
  Widget? button,
  Widget? icon,
  Color? aniamteColor,
}) {
  return Get.showSnackbar(
    GetSnackBar(
      title: title,
      titleText: titleText,
      message: message,
      messageText: Text(
        "$message",
        style: ThemeHelper(Get.context!)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.whiteColor),
      ),
      icon: icon,
      maxWidth: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppConstant.appMarginTwentyTwo.w,
        vertical: AppConstant.appMarginTen.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.appMarginTwentyTwo.w,
        vertical: AppConstant.appMarginTwentyTwo.h,
      ),
      mainButton: button,
      duration: 5.seconds,
      borderColor: AppColors.primaryColor,
      borderRadius: 10.0,
      borderWidth: AppConstant.appWidthThemeOne,
      forwardAnimationCurve: Curves.bounceInOut,
      animationDuration: 1.seconds,
      backgroundColor: AppColors.primaryColor,
      progressIndicatorBackgroundColor: AppColors.yellowColor,
      progressIndicatorValueColor:
          AlwaysStoppedAnimation<Color>(aniamteColor ?? AppColors.primaryColor),
      dismissDirection: DismissDirection.horizontal,
      //showProgressIndicator: true,
      snackPosition: SnackPosition.BOTTOM,
      reverseAnimationCurve: Curves.linear,
    ),
  );
}
