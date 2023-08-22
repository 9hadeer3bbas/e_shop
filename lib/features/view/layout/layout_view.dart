import '../../../core/services/services.dart';
import '../../../core/shared/widgets/widgets_v1.dart';
import '../../controller/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  final BottomNavBarControllerImpl controller =
      Get.put(BottomNavBarControllerImpl());
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavBarControllerImpl>(
        builder: (_) {
          return SafeArea(
              child: myServices.sharedPreferences.getString("type") == "user"
                  ? controller.bottomNavBarUserPages[controller.currentIndex]
                  : controller
                      .bottomNavBarCompanyPages[controller.currentIndex]);
        },
      ),
      bottomNavigationBar:
          myServices.sharedPreferences.getString("type") == "user"
              ? BottomNavBarUser()
              : BottomNavBarCompany(),
    );
  }
}
