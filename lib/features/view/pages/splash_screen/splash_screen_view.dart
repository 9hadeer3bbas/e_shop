import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eshop_app/features/view/pages/lanugage/language_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constant/app_assets/app_assets.dart';
import '../../../../core/constant/colors/colors.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.primaryColor,
      splashIconSize: 250,
      splash: SvgPicture.asset(
        AppAssets.splashLogo,
        fit: BoxFit.none,
        width: context.screenWidth / 2,
        height: context.screenHeight / 3,
      ),
      nextScreen: const LanguageView(),
      animationDuration: 2.seconds,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
