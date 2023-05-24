import 'package:get/get.dart';

import '../core/constant/routes/routes.dart';
import '../features/view/pages/splash_screen/splash_screen_view.dart';

List<GetPage<dynamic>>? routes = [
  //Splash
  GetPage(
      name: AppRoutes.splashScreen,
      page: () {
        return const SplashScreenView();
      }),
  //Get First Page
  // GetPage(
  //     name: AppRoutes.getFirstPage,
  //     page: () {
  //       return const GetFirstPageView();
  //     }),
  // //Auth
  // GetPage(
  //     name: AppRoutes.signUp,
  //     page: () {
  //       return  const SignUpView();
  //     }),
];
