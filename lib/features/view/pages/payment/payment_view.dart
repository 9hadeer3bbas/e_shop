import 'dart:developer';

import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/functions/validation_on_input/validation_on_input.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final CartScreenControllerImpl controller =
      Get.put(CartScreenControllerImpl());

  final String totalPaymentAmount = Get.arguments['payment total'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartScreenControllerImpl>(
      initState: (state) {
        if (controller.regionsList.isEmpty) {
          for (var element in controller.regions) {
            controller.regionsList.add("${element.id}#${element.name}");
          }
          controller.dropdownRegionValue = controller.regionsList.first;
        } else {
          controller.regionsList[0] = "Regions";
          controller.dropdownRegionValue = controller.regionsList[0];
        }
      },
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
              },
            ),
            centerTitle: true,
            title: const Text("Payment"),
            titleTextStyle: ThemeHelper(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.formKey1,
                child: Column(
                  children: [
                    Text(
                      "Choose your region",
                      style: ThemeHelper(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 22.5,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor.withOpacity(0.8)),
                    ),
                    SizedBox(
                      width: 300,
                      height: 65,
                      child: DropdownButtonFormField<String>(
                        hint: const Text("Region"),
                        alignment: Alignment.center,
                        focusColor: AppColors.greyColor.withOpacity(0.5),
                        value: controller.dropdownRegionValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 15,
                        style: ThemeHelper(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: AppColors.blackColor, fontSize: 23.0),
                        decoration: InputDecoration(
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              height: 5.0.h,
                              width: 5.0.w,
                              child: SvgPicture.asset(
                                AppAssets.cart,
                                fit: BoxFit.fill,
                                semanticsLabel: 'Image',
                                colorFilter: ColorFilter.mode(
                                    AppColors.primaryColor.withOpacity(0.8),
                                    BlendMode.srcIn),
                              ),
                            ),
                            fillColor: AppColors.primaryColor.withOpacity(0.5),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    width: 0.5.w,
                                    color:
                                        AppColors.blackColor.withOpacity(0.8))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    width: 0.5.w,
                                    color:
                                        AppColors.blackColor.withOpacity(0.8))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    width: 0.5.w,
                                    color: AppColors.blackColor
                                        .withOpacity(0.8)))),
                        onChanged: (String? value) {
                          controller.onChangedRegion(value);
                        },
                        borderRadius: BorderRadius.circular(20.0),
                        items: controller.regionsList
                            .map<DropdownMenuItem<String>>(
                                (String regionValue) {
                          return DropdownMenuItem<String>(
                            value: regionValue,
                            child: regionValue.isEmpty
                                ? const Text("Region")
                                : Text(regionValue),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: ThemeHelper(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextFormField(
                      hintText: "Details",
                      textEditingController: controller.detailsController,
                      validation: (value) {
                        return validationOnInput(
                          value: value!,
                          min: 5,
                          max: 20,
                        );
                      },
                      keyBoardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      iconData: AppAssets.check,
                      iconDataColor: const Color(0xFFF0F3F8),
                    ),
                    SizedBox(
                      height: 200.0.h,
                    ),
                    Center(
                      child: CustomButton(
                          childWidget: Center(
                              child: Text(
                            "Pay",
                            style: ThemeHelper(Get.context!)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w600),
                          )),
                          onTapButton: () async {
                            if (controller.formKey1.currentState!.validate()) {
                              Get.defaultDialog(
                                title: "Confirmation",
                                middleText:
                                    "Your order value is ${controller.total} \n You can track the order's status from Order Status Screen \n we will send you the expected delivery time",
                                contentPadding: const EdgeInsets.only(
                                    right: 5.0,
                                    left: 5.0,
                                    bottom: 40.0,
                                    top: 20.0),
                                middleTextStyle:
                                    ThemeHelper(context).textTheme.displayLarge,
                                confirm: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 30.0,
                                                  vertical: 10.0)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.primaryColor)),
                                      onPressed: () async {
                                        List<String> regsId = controller
                                            .dropdownRegionValue
                                            .split("#");
                                        String regionId = regsId[0].trim();
                                        List<String> totalPaymentAmounts =
                                            totalPaymentAmount.split(".");
                                        String totalPA =
                                            totalPaymentAmounts[0].trim();

                                        log(regionId);
                                        log(controller.detailsController.text);
                                        log(totalPA);

                                        await controller.checkOutProduct(
                                          regionId: regionId,
                                          details:
                                              controller.detailsController.text,
                                          total: totalPA,
                                        );

                                        //Get.isOverlaysClosed;
                                      },
                                      child: Text(
                                        "Confirm",
                                        style: ThemeHelper(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      )),
                                ),
                                cancel: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 38.0,
                                                  vertical: 10.5)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  side: BorderSide(
                                                      color: AppColors
                                                          .primaryColor,
                                                      width: 1.5)))),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: ThemeHelper(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.bold),
                                      )),
                                ),
                              );
                            }
                          },
                          colorButton: AppColors.primaryColor,
                          heightButton: 120.0.h,
                          widthButton: double.infinity),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
