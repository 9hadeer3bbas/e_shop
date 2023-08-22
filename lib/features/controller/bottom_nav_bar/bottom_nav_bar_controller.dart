import 'package:eshop_app/features/view/pages/account/account_view.dart';
import 'package:eshop_app/features/view/pages/add_product/add_product_view.dart';
import 'package:eshop_app/features/view/pages/cart/cart_view.dart';
import 'package:eshop_app/features/view/pages/home/home_view.dart';
import 'package:eshop_app/features/view/pages/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class BottomNavBarController extends GetxController {
  changeCurrentIndex(int index);
}

class BottomNavBarControllerImpl extends BottomNavBarController {
  late int currentIndex;

  List<Widget> bottomNavBarUserPages = [
    HomeScreen(),
    CartScreen(),
    NotificationsScreen(),
    AccountScreen(),
  ];
  List<Widget> bottomNavBarCompanyPages = [
    HomeScreen(),
    AddProductScreen(),
    NotificationsScreen(),
    AccountScreen(),
  ];
  @override
  changeCurrentIndex(int index) {
    currentIndex = index;
    HapticFeedback.lightImpact();
    update();
  }

  @override
  void onInit() {
    currentIndex = 0;
    super.onInit();
  }
}
