import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/colors/colors.dart';
import '../../constant/constant.dart';

SnackbarController showSnackBarMessage({
  String? title,
  Text? titleText,
  String? message,
  Text? messageText,
  Widget? button,
  Widget? icon,
  Color? aniamteColor, 
}) {
  return Get.showSnackbar(
    GetSnackBar(
      title: title,
      titleText: titleText,
      message: message,
      messageText: messageText,
      icon: icon,
      maxWidth: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppConstant.appMarginTwentyTwo.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.appMarginTwentyTwo.h,
        vertical: AppConstant.appMarginTwentyTwo.w,
      ),
      mainButton: button,
      duration: 20.seconds,
      backgroundGradient: const LinearGradient(
        colors: AppColors.linerBlueColor,
      ),
      borderColor: AppColors.secondaryColor,
      borderRadius: AppConstant.appRadius,
      borderWidth: AppConstant.appWidthThemeOne,
      forwardAnimationCurve: Curves.bounceInOut,
      leftBarIndicatorColor: AppColors.yellowColor,
      animationDuration: 1.seconds,
      progressIndicatorBackgroundColor: AppColors.yellowColor,
      progressIndicatorValueColor:  AlwaysStoppedAnimation<Color>(aniamteColor??AppColors.primaryColor),
      dismissDirection: DismissDirection.horizontal,
      showProgressIndicator: true,
      snackPosition: SnackPosition.TOP,
      reverseAnimationCurve: Curves.linear,
    ),
  );
}
