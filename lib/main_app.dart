// ignore_for_file: unused_import

import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:eshop_app/core/services/services.dart';
import 'package:eshop_app/features/view/layout/layout_view.dart';
import 'package:eshop_app/features/view/pages/auth/sign_in/sign_in.dart';
import 'package:eshop_app/features/view/pages/get_first_page/get_first_page_view.dart';
import 'package:eshop_app/features/view/pages/home/home_view.dart';
import 'package:eshop_app/features/view/pages/lanugage/language_view.dart';
import 'package:eshop_app/features/view/pages/popular/popular_view.dart';
import 'package:eshop_app/features/view/pages/product_details/product_details_view.dart';
import 'package:eshop_app/features/view/pages/reviews/reviews_view.dart';
import 'package:eshop_app/features/view/pages/splash_screen/splash_screen_view.dart';
import 'package:eshop_app/features/view/pages/status/no_order/no_order_view.dart';
import 'package:eshop_app/features/view/pages/status/order_failed/order_failed_view.dart';
import 'package:eshop_app/features/view/pages/status/payment_success/payment_success.dart';
import 'package:eshop_app/features/view/pages/status/registration_success/registration_success_view.dart';
import 'package:eshop_app/test_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_binding/app_binding.dart';
import 'core/constant/constant.dart';
import 'core/localization/translation.dart';
import 'core/shared/app_theme/app_theme.dart';
import 'features/controller/change_language/changed_language_controller.dart';
import 'features/view/pages/auth/sign_up/sign_up_user_view.dart';
import 'pages_routes/pages_routes.dart';

//main app
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    MyServices myServices = Get.find();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    return ScreenUtilInit(
      designSize: Size(AppConstant.screenWidth, AppConstant.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          locale: controller.language,
          translations: AppTranslation(),
          debugShowCheckedModeBanner: false,
          title: "E-Shop",
          theme: AppTheme.apptheme(context),
          enableLog: true,
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 1),
          initialBinding: AppBinding(),
          textDirection:
              sharedPrefLang == 'en' ? TextDirection.ltr : TextDirection.rtl,
          getPages: routes,
          initialRoute: AppRoutes.splashScreen,
          //home: ReviewsScreen(),
        );
      },
    );
  }
}
