import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Sign Up"),
        leading: IconButton(
            splashRadius: 25.0,
            icon: SizedBox(
              height: 18,
              width: 10,
              child: SvgPicture.asset(
                AppAssets.leftArrow,
                fit: BoxFit.fill,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey3Color,
                  BlendMode.srcIn,
                ),
              ),
            ),
            onPressed: () {
              Get.back();
            }),
        titleTextStyle: ThemeHelper(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
      ),
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
                      AppAssets.registrationSuccess,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    Text(
                      "Done",
                      style:
                          ThemeHelper(context).textTheme.displayLarge!.copyWith(
                                fontSize: 30.0.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    Text(
                      "You have successfully completed\nyour registration",
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
                    "Sign In",
                    style: ThemeHelper(Get.context!)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600),
                  )),
                  onTapButton: () {
                    Get.offNamed(AppRoutes.signIn);
                  },
                  colorButton: AppColors.primaryColor,
                  heightButton: 120.0.h,
                  widthButton: 400.0.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
