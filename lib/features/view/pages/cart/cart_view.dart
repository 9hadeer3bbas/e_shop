import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/controller/cart/cart_controller.dart';
import 'package:eshop_app/features/view/pages/status/no_order/no_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartScreenControllerImpl controller =
      Get.put(CartScreenControllerImpl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartScreenControllerImpl>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 0.0,
            centerTitle: true,
            title: const Text("Cart"),
            titleTextStyle: ThemeHelper(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: controller.isNoOrder
                ? const NoOrderScreen()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCartWidget(
                              cartController: controller,
                              product: controller.products.keys.toList()[index],
                              quantity:
                                  controller.products.values.toList()[index],
                              index: index,
                            );
                          },
                        ),
                        SizedBox(
                          height: 50.0.h,
                        ),
                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0.r)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 40.0),
                            height: 200.h,
                            width: 560.w,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Selected Items "
                                      "(${controller.products.length})",
                                      style: ThemeHelper(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: AppColors.blackColor),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "Total Cost :",
                                      style: ThemeHelper(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.total.isEmpty
                                          ? ""
                                          : "\$${controller.total}",
                                      style: ThemeHelper(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0.sp,
                                          ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        Center(
                          child: CustomButton(
                            childWidget: Center(
                              child: Text(
                                "Checkout",
                                style: ThemeHelper(Get.context!)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            onTapButton: () {
                              Get.toNamed(
                                AppRoutes.payment,
                                arguments: {
                                  "payment total": controller.total,
                                },
                              );
                            },
                            colorButton: AppColors.primaryColor,
                            heightButton: 120.0.h,
                            widthButton: double.infinity,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
