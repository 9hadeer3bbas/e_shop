import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/controller/product/product_controller.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchProductScreen extends StatelessWidget {
  SearchProductScreen({super.key});
  final ProductControllerImpl controller = Get.put(ProductControllerImpl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImpl>(
      builder: (_) {
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
                      colorFilter: const ColorFilter.mode(
                          AppColors.grey3Color, BlendMode.srcIn),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  }),
              centerTitle: true,
              title: const Text("Search Product"),
              titleTextStyle: ThemeHelper(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchProductsListView(),
            ));
      },
    );
  }
}
