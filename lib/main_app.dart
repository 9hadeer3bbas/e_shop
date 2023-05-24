import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:eshop_app/features/view/pages/auth/sign_in/sign_in.dart';
import 'package:eshop_app/features/view/pages/get_first_page/get_first_page_view.dart';
import 'package:eshop_app/features/view/pages/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_binding/app_binding.dart';
import 'core/constant/constant.dart';
import 'core/shared/app_theme/app_theme.dart';
import 'pages_routes/pages_routes.dart';

//main app
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppConstant.screenWidth, AppConstant.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "E-Shop",
          theme: AppTheme.apptheme(context),
          enableLog: true,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(seconds: 1),
          initialBinding: AppBinding(),
          textDirection: TextDirection.ltr,
          getPages: routes,
          //initialRoute: AppRoutes.splashScreen,
          home: SplashScreenView(),
        );
      },
    );
  }
}
