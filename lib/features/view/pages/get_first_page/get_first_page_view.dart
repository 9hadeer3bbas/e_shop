import 'package:eshop_app/features/view/pages/auth/sign_in/sign_in.dart';
import 'package:eshop_app/features/view/pages/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_assets/app_assets.dart';
import '../../../../core/constant/colors/colors.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/constant/routes/routes.dart';
import '../../../../core/shared/extentions/extentions.dart';

import '../../widgets/get_first_page/build_custom_button_item.dart';
import '../../widgets/get_first_page/build_custom_text_item.dart';

class GetFirstPageView extends StatelessWidget {
  const GetFirstPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 100.h,
            ),
            SvgPicture.asset(
              AppAssets.appLogoPrimary,
              fit: BoxFit.none,
              width: context.screenWidth / 2,
              height: context.screenHeight / 3,
            ),
            SizedBox(
              height: context.screenHeight / 120,
            ),
            Center(
                child: Text("الكثير من",
                    style: ThemeHelper(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                            fontSize: 30.0, color: AppColors.primaryColor))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildCustomTextItem(
                  text: "المنتجات",
                  color: const Color(0xFF1E2126),
                  fontSize: AppConstant.fontSizeTwentyFour,
                ),
                SizedBox(
                  width: AppConstant.spaceFive.w,
                ),
                BuildCustomTextItem(
                  text: "و",
                  color: AppColors.primaryColor,
                  fontSize: AppConstant.fontSizeTwentyFour,
                ),
                SizedBox(
                  width: AppConstant.spaceFive.w,
                ),
                BuildCustomTextItem(
                  text: "الخدمات",
                  color: const Color(0xFF1E2126),
                  fontSize: AppConstant.fontSizeTwentyFour,
                ),
              ],
            ),
            SizedBox(
              height: AppConstant.spaceTen.h,
            ),
            BuildCustomTextItem(
              text: "ستجد كل ما تحتاجه معنا",
              color: AppColors.lightGrayThreeColor,
              fontSize: AppConstant.fontSizeTwentyFour,
            ),
            SizedBox(
              height: context.screenHeight / 20,
            ),
            BuildCustomButtonItem(
              text: 'ابدأ الأن',
              colorText: const Color(0xFFF0F3F8),
              colorButton: AppColors.primaryColor,
              onTapButton: () {
                Get.to(SignUpScreen());
              },
            ),
            SizedBox(
              height: context.screenHeight / 20,
            ),
            BuildCustomButtonItem(
              text: 'تسجيل الدخول',
              colorText: AppColors.primaryColor,
              colorButton: const Color(0xFFF0F3F8),
              onTapButton: () {
                Get.to(SignInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
