import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/services/services.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/controller/add_product/add_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

import '../../../../core/functions/validation_on_input/validation_on_input.dart';
import '../../../controller/home/home_controller.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final AddProductScreenControllerImpl controller =
      Get.put(AddProductScreenControllerImpl());
  final HomeScreenControllerImpl homeScreenControllerImpl =
      Get.put(HomeScreenControllerImpl());
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    int color1 = 2;
    int color2 = 3;
    return GetBuilder<AddProductScreenControllerImpl>(
      initState: (state) {
        if (controller.listofCategory.isEmpty) {
          for (var element in homeScreenControllerImpl.categories) {
            controller.listofCategory.add("${element.id}#${element.name}");
          }
          controller.dropdownCategoryValue = controller.listofCategory.first;
        } else {
          controller.listofCategory[0] = "Categories";
          controller.dropdownCategoryValue = controller.listofCategory[0];
        }
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 0.0,
            centerTitle: true,
            title: const Text("Add Product"),
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
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddProductPhotoComponent(
                        image: controller.image1Temporary,
                        onPressedPickImage: () async {
                          await controller.pickImage1();
                        },
                      ),
                      const SizedBox(
                        width: 65.0,
                      ),
                      AddProductPhotoComponent(
                        image: controller.image2Temporary,
                        onPressedPickImage: () async {
                          await controller.pickImage2();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  Text(
                    "Choose your Category",
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
                      hint: const Text("Category"),
                      alignment: Alignment.center,
                      focusColor: AppColors.greyColor.withOpacity(0.5),
                      value: controller.dropdownCategoryValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 15,
                      style: ThemeHelper(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: AppColors.blackColor, fontSize: 21.0),
                      decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            height: 5.0.h,
                            width: 5.0.w,
                            child: SvgPicture.asset(
                              AppAssets.productList,
                              fit: BoxFit.contain,
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
                                  color:
                                      AppColors.blackColor.withOpacity(0.8)))),
                      onChanged: (String? value) {
                        controller.onChangedCategory(value);
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      items: controller.listofCategory
                          .map<DropdownMenuItem<String>>(
                              (String categoryValue) {
                        return DropdownMenuItem<String>(
                          value: categoryValue,
                          child: categoryValue.isEmpty
                              ? const Text("Category")
                              : Text(categoryValue),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Text(
                    "Choose your Quantities",
                    style: ThemeHelper(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                            fontSize: 22.5,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor.withOpacity(0.8)),
                  ),
                  SizedBox(
                    width: 210,
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      hint: const Text("Quantities"),
                      alignment: Alignment.center,
                      focusColor: AppColors.greyColor.withOpacity(0.5),
                      value: controller.dropdownQuantitiesValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 15,
                      style: ThemeHelper(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: AppColors.blackColor, fontSize: 21.0),
                      decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            height: 5.0.h,
                            width: 5.0.w,
                            child: SvgPicture.asset(
                              AppAssets.productVariant,
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
                                  color:
                                      AppColors.blackColor.withOpacity(0.8)))),
                      onChanged: (String? value) {
                        controller.onChangedQuantities(value);
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      items: AddProductScreenControllerImpl.listofQuantities
                          .map<DropdownMenuItem<String>>(
                              (String quantitiesValue) {
                        return DropdownMenuItem<String>(
                          value: quantitiesValue,
                          child: quantitiesValue.isEmpty
                              ? const Text("Quantities")
                              : Text(quantitiesValue),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style:
                            ThemeHelper(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    hintText: "Product Name",
                    textEditingController: controller.productNameController,
                    validation: (value) {
                      return validationOnInput(
                        value: value!,
                        min: 3,
                        max: 20,
                      );
                    },
                    keyBoardType: TextInputType.name,
                    textDirection: TextDirection.ltr,
                    iconData: AppAssets.check,
                    iconDataColor: const Color(0xFFF0F3F8),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Product Price",
                        style:
                            ThemeHelper(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    hintText: "Product Price",
                    textEditingController: controller.productPriceController,
                    validation: (value) {
                      return validationOnInput(
                        value: value!,
                        min: 4,
                        max: 11,
                      );
                    },
                    keyBoardType: TextInputType.number,
                    textDirection: TextDirection.ltr,
                    iconData: AppAssets.check,
                    iconDataColor: const Color(0xFFF0F3F8),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style:
                            ThemeHelper(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    hintText: "Description",
                    textEditingController:
                        controller.productDiscriptionController,
                    validation: (value) {
                      return validationOnInput(
                        value: value!,
                        min: 10,
                        max: 121,
                      );
                    },
                    keyBoardType: TextInputType.name,
                    textDirection: TextDirection.ltr,
                    iconData: AppAssets.check,
                    iconDataColor: const Color(0xFFF0F3F8),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 45.0.h,
                    width: double.infinity,
                    child: Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          "Choose Color of Product",
                          style: ThemeHelper(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: 20.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            controller.changeColor1();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 13.0,
                                backgroundColor: AppColors.blackColor,
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                              if (controller.btn1)
                                Container(
                                  width: 35.0.w,
                                  height: 35.0.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: AppColors.blueColor
                                              .withOpacity(0.8))),
                                  child: const Icon(
                                    Icons.check,
                                    color: AppColors.whiteColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeColor2();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 13.0,
                                backgroundColor: AppColors.blueColor,
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                              if (controller.btn2)
                                Container(
                                  width: 35.0.w,
                                  height: 35.0.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: AppColors.blueColor
                                              .withOpacity(0.8))),
                                  child: const Icon(
                                    Icons.check,
                                    color: AppColors.whiteColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeColor3();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 13.0,
                                backgroundColor: AppColors.redColor,
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                              if (controller.btn3)
                                Container(
                                  width: 35.0.w,
                                  height: 35.0.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: AppColors.blueColor
                                              .withOpacity(0.8))),
                                  child: const Icon(
                                    Icons.check,
                                    color: AppColors.whiteColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  Center(
                    child: CustomButton(
                        childWidget: Center(
                            child: Text(
                          "Add to Store",
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
                                  "Do you want to add this product to store ? \n  it will be sent as pending product to dashboard and it will not added to store until the admin aprove it",
                              contentPadding: const EdgeInsets.only(
                                  right: 20.0,
                                  left: 20.0,
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
                                      List<String> catsId = controller
                                          .dropdownCategoryValue
                                          .split("#");
                                      String catId = catsId[0].trim();

                                      if (controller.btn1 && controller.btn2) {
                                        color1 = 2;
                                        color2 = 3;
                                      } else if (controller.btn1 &&
                                          controller.btn3) {
                                        color1 = 2;
                                        color2 = 5;
                                      } else if (controller.btn2 &&
                                          controller.btn3) {
                                        color1 = 3;
                                        color2 = 5;
                                      } else {
                                        color1 = 2;
                                        color2 = 3;
                                      }

                                      await controller.createProduct(
                                        categoryId: catId,
                                        name: controller
                                            .productNameController.text,
                                        oldPrice: controller
                                            .productPriceController.text,
                                        description: controller
                                            .productDiscriptionController.text,
                                        color1: color1,
                                        color2: color2,
                                        quantities1: int.parse(
                                            controller.dropdownQuantitiesValue),
                                        quantities2: int.parse(
                                            controller.dropdownQuantitiesValue),
                                        image1: controller.image1Temporary,
                                        image2: controller.image2Temporary,
                                      );
                                      Get.isOverlaysClosed;
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
                                                    BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
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
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
