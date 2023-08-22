import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_assets/app_assets.dart';
import '../../constant/colors/colors.dart';
import '../../functions/text_styles/text_styles.dart';
import '../status_requests/status_requests.dart';

class HandlingDataShow extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataShow(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/lottie/loading.json",
                  animate: true,
                  width: 120.w,
                  height: 120.h,
                ),
                Text(
                  "جاري التحميل",
                  style: textStyles(
                    fontSize: 16.sp,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: AppColors.linerBlueColor,
                      ).createShader(
                        const Rect.fromLTWH(300.0, 300.0, 300.0, 300.0),
                      ),
                  ),
                ),
              ],
            ),
        )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(
                  AppAssets.offline,
                  width: 200.w,
                  height: 200.h,
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(
                      AppAssets.server,
                      width: 150.w,
                      height: 150.h,
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                          AppAssets.noData,
                          width: 150.w,
                          height: 150.h,
                        ),
                      )
                    : statusRequest == null
                        ? widget
                        : widget;
  }
}