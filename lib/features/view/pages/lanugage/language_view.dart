import 'package:eshop_app/features/controller/change_language/changed_language_controller.dart';
import 'package:eshop_app/features/view/pages/on_boarding/on_boarding_english_view.dart';
import 'package:eshop_app/features/view/pages/on_boarding/onboeading_arabic_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_assets/app_assets.dart';
import '../../../../core/constant/colors/colors.dart';
import '../../../../core/shared/extentions/extentions.dart';

import '../../widgets/get_first_page/build_custom_button_item.dart';

class LanguageView extends GetView<LocaleController> {
  const LanguageView({super.key});

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
              fit: BoxFit.contain,
              width: context.screenWidth / 3.5,
              height: context.screenHeight / 3.5,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textDirection: TextDirection.ltr,
                  "Please choose your language!",
                  style: ThemeHelper(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  textDirection: TextDirection.ltr,
                  "!الرجاء اختر اللغة الخاصة بك",
                  style: ThemeHelper(context).textTheme.headlineLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 150.0,
            ),
            BuildCustomButtonItem(
              text: 'English',
              colorText: const Color(0xFFF0F3F8),
              colorButton: AppColors.primaryColor,
              onTapButton: () {
                controller.changeLang('en');
                Get.to(OnBoardingEnglishView());
              },
            ),
            SizedBox(
              height: context.screenHeight / 20,
            ),
            BuildCustomButtonItem(
              text: 'العربية',
              colorText: AppColors.primaryColor,
              colorButton: const Color(0xFFF0F3F8),
              onTapButton: () {
                controller.changeLang('ar');
                Get.to(OnBoardingArabicView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
