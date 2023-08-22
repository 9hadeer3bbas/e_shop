import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/view/layout/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

class OrderFeiledScreen extends StatelessWidget {
  const OrderFeiledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 40.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppAssets.failed,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    Text(
                      "Oops! Order Failed",
                      textDirection: TextDirection.ltr,
                      style: ThemeHelper(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(
                              fontSize: 30.0.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    Text(
                      "Something went wrong, Try Again",
                      textAlign: TextAlign.center,
                      style: ThemeHelper(context).textTheme.displayLarge,
                    )
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 400.0.w,
                child: CustomButton(
                    childWidget: Center(
                        child: Text(
                      "Back to Home",
                      style: ThemeHelper(Get.context!)
                          .textTheme
                          .displayLarge!
                          .copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600),
                    )),
                    onTapButton: () {
                      Get.to(LayoutScreen());
                    },
                    colorButton: AppColors.primaryColor,
                    heightButton: 120.0.h,
                    widthButton: 400.0.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
