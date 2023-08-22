import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/product/product_controller.dart';
import '../../../data/models/categories/category_model.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  final ProductControllerImpl controller = Get.put(ProductControllerImpl());

  final Category category = Get.arguments['category'];

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
                      fit: BoxFit.contain,
                      colorFilter: const ColorFilter.mode(
                          AppColors.grey3Color, BlendMode.srcIn),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  }),
              centerTitle: true,
              title: Text(category.name ?? ""),
              titleTextStyle: ThemeHelper(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomProductsWithinCategoryListView(),
            ));
      },
    );
  }
}
