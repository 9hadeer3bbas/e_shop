import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/services/services.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/view/pages/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_assets/app_assets.dart';
import '../../../controller/home/home_controller.dart';

class PopularScreen extends StatelessWidget {
  PopularScreen({super.key});
    final HomeScreenControllerImpl controller =
      Get.put(HomeScreenControllerImpl());

  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: IconButton(
          splashRadius: 25.0,
          icon: SizedBox(
            height: 18,
            width: 10,
            child: SvgPicture.asset(
              AppAssets.leftArrow,
              fit: BoxFit.fill,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey3Color, BlendMode.srcIn),
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text("Popular"),
        actions: [
          if (myServices.sharedPreferences.getString("type") == "user")
            IconButton(
              splashRadius: 25.0,
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  AppAssets.cart,
                  fit: BoxFit.fill,
                  colorFilter: const ColorFilter.mode(
                    AppColors.grey3Color,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              onPressed: () {
                Get.to(CartScreen());
              },
            ),
          const SizedBox(
            width: 8.0,
          ),
        ],
        titleTextStyle: ThemeHelper(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
      ),
      body: CustomPopularProductsListView(),
    );
  }
}
