import 'package:eshop_app/features/view/pages/auth/forget_password/forget_password_view.dart';
import 'package:eshop_app/features/view/pages/auth/reset_password/reset_password_view.dart';
import 'package:eshop_app/features/view/pages/cart/cart_view.dart';
import 'package:eshop_app/features/view/pages/change_password/change_password_view.dart';
import 'package:eshop_app/features/view/pages/payment/payment_view.dart';
import 'package:eshop_app/features/view/pages/product_details/product_details_view.dart';
import 'package:eshop_app/features/view/pages/products/products_view.dart';
import 'package:eshop_app/features/view/pages/search_product/search_product_view.dart';
import 'package:eshop_app/features/view/pages/status/payment_success/payment_success.dart';
import 'package:eshop_app/features/view/pages/status/registration_success/registration_success_view.dart';

import '../features/view/layout/layout_view.dart';
import '../features/view/pages/auth/sign_in/sign_in.dart';
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
  //Auth
  GetPage(
      name: AppRoutes.signIn,
      page: () {
        return SignInScreen();
      }),
  GetPage(
      name: AppRoutes.layout,
      page: () {
        return LayoutScreen();
      }),

  GetPage(
      name: AppRoutes.productDetails,
      page: () {
        return ProductDetailsScreen();
      }),
  GetPage(
      name: AppRoutes.products,
      page: () {
        return ProductsScreen();
      }),
  GetPage(
      name: AppRoutes.results,
      page: () {
        return SearchProductScreen();
      }),
  GetPage(
      name: AppRoutes.payment,
      page: () {
        return PaymentScreen();
      }),
  GetPage(
      name: AppRoutes.cart,
      page: () {
        return CartScreen();
      }),
  GetPage(
      name: AppRoutes.paymentSuccess,
      page: () {
        return const PaymentSuccessScreen();
      }),
  GetPage(
      name: AppRoutes.registerationSuccess,
      page: () {
        return const RegistrationSuccessScreen();
      }),
  GetPage(
      name: AppRoutes.changePassword,
      page: () {
        return ChangePasswordScreen();
      }),
  GetPage(
      name: AppRoutes.forgetPassword,
      page: () {
        return ForgetPasswordScreen();
      }),
  GetPage(
      name: AppRoutes.resetPassword,
      page: () {
        return ResetPasswordScreen();
      }),
];
