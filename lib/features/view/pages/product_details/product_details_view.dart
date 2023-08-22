import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';
import 'package:eshop_app/features/data/models/product/product_model.dart';

import '../../../../core/constant/app_assets/app_assets.dart';
import '../../../../core/constant/colors/colors.dart';
import '../../../../core/services/services.dart';
import '../../../../core/shared/widgets/widgets_v1.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../controller/product/product_controller.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared/extentions/extentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  final ProductControllerImpl controller = Get.put(ProductControllerImpl());
  final CartScreenControllerImpl cartScreenControllerImpl =
      Get.put(CartScreenControllerImpl());
  final MyServices myServices = Get.find();
  final Product product = Get.arguments['product'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImpl>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0.0,
          // leading: IconButton(
          //   splashRadius: 25.0,
          //   icon: SizedBox(
          //     height: 18,
          //     width: 10,
          //     child: SvgPicture.asset(
          //       AppAssets.leftArrow,
          //       fit: BoxFit.fill,
          //       colorFilter: const ColorFilter.mode(
          //           AppColors.grey3Color, BlendMode.srcIn),
          //     ),
          //   ),
          //   onPressed: () {
          //     Get.back();
          //   },
          // ),
          centerTitle: true,
          title: Text(product.name ?? ""),
          leading: IconButton(
              splashRadius: 25.0,
              icon: SizedBox(
                height: 20,
                width: 20,
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
          titleTextStyle: ThemeHelper(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.0.h,
                ),
                Center(
                  child: Container(
                    width: 400.0.w,
                    height: 400.0.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: CachedNetworkImage(
                      imageUrl: "${AppLinksApi.apiImages}/${product.image}",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(product.name ?? "",
                        style: ThemeHelper(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.ltr,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.minusNum();
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                                color: controller.focusColor,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                              child: SvgPicture.asset(AppAssets.minus),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30.0.w,
                          height: 30.0.h,
                          child: Text(
                            " ${controller.counter} ",
                            style: ThemeHelper(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        InkWell(
                          onTap: () {
                            controller.plusNum();
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                                color: AppColors.grey3Color,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                              child: SvgPicture.asset(AppAssets.plus),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    SizedBox(
                      height: 20.0.h,
                      width: 20.0.w,
                      child: SvgPicture.asset(
                        AppAssets.star,
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                            Color(0xFFFDC34E), BlendMode.srcIn),
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Text(
                      product.viewer.toString(),
                      textAlign: TextAlign.end,
                      style: ThemeHelper(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor.withOpacity(0.5)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeColor1(true);
                        controller.changeColor2(false);
                        controller.changeColor3(false);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10.0,
                            backgroundColor: AppColors.blueColor,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          if (controller.btn1)
                            Container(
                              width: 30.0.w,
                              height: 30.0.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                      width: 2.0,
                                      color: AppColors.blueColor
                                          .withOpacity(0.8))),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.changeColor1(false);
                        controller.changeColor2(true);
                        controller.changeColor3(false);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10.0,
                            backgroundColor: AppColors.redColor,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          if (controller.btn2)
                            Container(
                              width: 30.0.w,
                              height: 30.0.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                      width: 2.0,
                                      color: AppColors.blueColor
                                          .withOpacity(0.8))),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.changeColor1(false);
                        controller.changeColor2(false);
                        controller.changeColor3(true);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10.0,
                            backgroundColor: AppColors.yellowColor,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          if (controller.btn3)
                            Container(
                              width: 30.0.w,
                              height: 30.0.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                      width: 2.0,
                                      color: AppColors.blueColor
                                          .withOpacity(0.8))),
                            )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ ${product.newPrice}",
                      style: ThemeHelper(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 40.0.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                Text(
                  "Description",
                  style: ThemeHelper(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.blackColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  product.description ?? "",
                  textDirection: TextDirection.ltr,
                  style: ThemeHelper(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 45.0.h,
                ),
                if (myServices.sharedPreferences.getString("type") == "user")
                  Center(
                    child: CustomButton(
                        childWidget: Center(
                            child: Text(
                          "Add to Cart",
                          style: ThemeHelper(Get.context!)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600),
                        )),
                        onTapButton: () {
                          cartScreenControllerImpl.addProduct(product);
                        },
                        colorButton: AppColors.primaryColor,
                        heightButton: 120.0.h,
                        widthButton: double.infinity),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
