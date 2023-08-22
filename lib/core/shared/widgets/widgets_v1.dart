import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';
import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:eshop_app/features/controller/product/product_controller.dart';

import '../../../features/controller/cart/cart_controller.dart';
import '../../../features/data/models/product/product_model.dart';
import '../../functions/validation_on_input/validation_on_input.dart';
import '../../services/services.dart';
import '../extentions/extentions.dart';
import '../../../features/controller/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../features/controller/home/home_controller.dart';
import '../../constant/app_assets/app_assets.dart';
import '../../constant/colors/colors.dart';
import '../../constant/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? iconData;
  final Color? iconDataColor;
  final TextEditingController textEditingController;
  final String? Function(String?) validation;
  final void Function()? onTapSuffix;
  final bool? obscureText;
  final TextInputType keyBoardType;
  final TextDirection? textDirection;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.iconDataColor,
    this.iconData,
    required this.textEditingController,
    required this.validation,
    this.obscureText,
    this.onTapSuffix,
    required this.keyBoardType,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFFF0F3F8),
          borderRadius: BorderRadius.circular(12.0)),
      width: 380,
      height: 70,
      child: TextFormField(
        controller: textEditingController,
        validator: validation,
        style: const TextStyle(fontSize: 20.0, color: Color(0xFF828B9A)),
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyBoardType,
        focusNode: FocusNode(),
        textInputAction: TextInputAction.send,
        textDirection: textDirection,
        mouseCursor: MaterialStateMouseCursor.clickable,
        showCursor: true,
        cursorColor: AppColors.lightGrayThreeColor,
        cursorRadius: Radius.circular(AppConstant.appRadius),
        cursorHeight: 15.0,
        scrollPhysics: const BouncingScrollPhysics(),
        decoration: InputDecoration(
          fillColor: AppColors.greyColor.withOpacity(0.5),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(15.0),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.greyColor, fontSize: 20.0),
          suffixIcon: SizedBox(
            height: 15.h,
            width: 17.25.w,
            child: InkWell(
              onTap: onTapSuffix,
              child: SvgPicture.asset(
                iconData!,
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(iconDataColor!, BlendMode.srcIn),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: const Color(0xFFF0F3F8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: const Color(0xFFF0F3F8),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: AppColors.redColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: AppColors.lightGrayThreeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormFieldv2 extends StatelessWidget {
  final String hintText;
  final String? iconData;
  final Color? iconDataColor;
  final Color? iconDataPrifixColor;
  final TextEditingController textEditingController;
  final String? Function(String?) validation;
  final void Function()? onTapSuffix;
  final bool? obscureText;
  final TextInputType keyBoardType;
  final TextDirection? textDirection;
  final String? iconPrifixIcon;
  const CustomTextFormFieldv2({
    Key? key,
    required this.hintText,
    this.iconDataColor,
    this.iconDataPrifixColor,
    this.iconData,
    this.iconPrifixIcon,
    required this.textEditingController,
    required this.validation,
    this.obscureText,
    this.onTapSuffix,
    required this.keyBoardType,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFFF0F3F8),
          borderRadius: BorderRadius.circular(12.0)),
      width: 380,
      height: 70,
      child: TextFormField(
        controller: textEditingController,
        validator: validation,
        style: const TextStyle(fontSize: 20.0, color: Color(0xFF828B9A)),
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyBoardType,
        focusNode: FocusNode(),
        textInputAction: TextInputAction.send,
        textDirection: textDirection,
        mouseCursor: MaterialStateMouseCursor.clickable,
        showCursor: true,
        cursorColor: AppColors.lightGrayThreeColor,
        cursorRadius: Radius.circular(AppConstant.appRadius),
        cursorHeight: 15.0,
        scrollPhysics: const BouncingScrollPhysics(),
        decoration: InputDecoration(
          fillColor: AppColors.greyColor.withOpacity(0.5),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(15.0),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.greyColor, fontSize: 20.0),
          prefixIcon: SizedBox(
            height: 15.h,
            width: 17.25.w,
            child: InkWell(
              onTap: onTapSuffix,
              child: SvgPicture.asset(
                iconPrifixIcon!,
                fit: BoxFit.none,
                colorFilter:
                    ColorFilter.mode(iconDataPrifixColor!, BlendMode.srcIn),
              ),
            ),
          ),
          prefixIconColor: iconDataColor,
          suffixIcon: SizedBox(
            height: 15.h,
            width: 17.25.w,
            child: InkWell(
              onTap: onTapSuffix,
              child: SvgPicture.asset(
                iconData!,
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(iconDataColor!, BlendMode.srcIn),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: const Color(0xFFF0F3F8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: const Color(0xFFF0F3F8),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: AppColors.redColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: AppColors.lightGrayThreeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final Widget childWidget;
  final void Function() onTapButton;
  final Color colorButton;
  final Color? highlightColorButton;
  final Color? splashColorButton;
  final Color? hoverColorButton;
  final Color? focusColorButton;
  final double heightButton;
  final double widthButton;
  const CustomButton({
    super.key,
    required this.childWidget,
    required this.onTapButton,
    required this.colorButton,
    this.highlightColorButton,
    this.splashColorButton,
    this.hoverColorButton,
    this.focusColorButton,
    required this.heightButton,
    required this.widthButton,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(AppConstant.appRadius),
      ),
      highlightColor: widget.highlightColorButton,
      splashColor: widget.splashColorButton,
      hoverColor: widget.hoverColorButton,
      focusColor: widget.focusColorButton,
      splashFactory: InkSplash.splashFactory,
      radius: 11.r,
      focusNode: FocusNode(),
      onHighlightChanged: (value) {
        setState(
          () {},
        );
      },
      onTap: widget.onTapButton,
      child: AnimatedContainer(
        duration: 1000.milliseconds,
        curve: Curves.fastLinearToSlowEaseIn,
        height: 70.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: widget.colorButton,
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstant.appRadius),
          ),
        ),
        child: widget.childWidget,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String textData;
  final TextOverflow? overFlowText;
  final TextAlign? textAlignText;
  final int? maxLineTextSpan;
  final TextStyle textStyles;
  final StrutStyle? strutStyles;
  const CustomText({
    super.key,
    required this.textData,
    this.overFlowText,
    this.textAlignText,
    this.maxLineTextSpan,
    required this.textStyles,
    this.strutStyles,
    required TextDirection textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      overflow: overFlowText,
      textAlign: textAlignText,
      textDirection: TextDirection.rtl,
      maxLines: maxLineTextSpan,
      style: textStyles,
      strutStyle: strutStyles,
    );
  }
}

class CustomFloatingActionButtonOne extends StatelessWidget {
  final String imageButton;
  final void Function() onPressedButton;
  const CustomFloatingActionButtonOne({
    super.key,
    required this.onPressedButton,
    required this.imageButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              imageButton,
            ),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonTwo extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressedButton;
  final Color? colorButton;
  final Color iconColor;
  final List<Color>? colorsButton;
  const CustomFloatingActionButtonTwo({
    super.key,
    required this.onPressedButton,
    required this.iconData,
    this.colorButton,
    this.colorsButton,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorButton,
          gradient: LinearGradient(
            colors: colorsButton ?? [],
          ),
        ),
        child: Icon(
          iconData,
          size: 15,
          color: iconColor,
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonThree extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressedButton;

  final Color iconColor;
  final List<Color> colorsButton;
  const CustomFloatingActionButtonThree({
    super.key,
    required this.onPressedButton,
    required this.iconData,
    required this.colorsButton,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colorsButton,
          ),
        ),
        child: Icon(
          iconData,
          size: 15,
          color: iconColor,
        ),
      ),
    );
  }
}

class BottomNavBarUser extends StatelessWidget {
  BottomNavBarUser({super.key});

  final BottomNavBarControllerImpl controller =
      Get.put(BottomNavBarControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarControllerImpl>(
      builder: (_) {
        return Container(
          height: context.screenHeight * .09,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * .06),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.changeCurrentIndex(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == controller.currentIndex
                            ? context.screenHeight * .060
                            : 30,
                        width: index == controller.currentIndex
                            ? context.screenWidth * .250
                            : 30,
                        decoration: BoxDecoration(
                          color: index == controller.currentIndex
                              ? Colors.blueAccent.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(70),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppConstant.listOfUserIcons[index],
                          width: index == controller.currentIndex
                              ? 25.0.w
                              : 20.0.w,
                          colorFilter: index == controller.currentIndex
                              ? const ColorFilter.mode(
                                  Color(0xFF364FD4),
                                  BlendMode.srcIn,
                                )
                              : const ColorFilter.mode(
                                  Color(0xFFB9C1CC),
                                  BlendMode.srcIn,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BottomNavBarCompany extends StatelessWidget {
  BottomNavBarCompany({super.key});

  final BottomNavBarControllerImpl controller =
      Get.put(BottomNavBarControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarControllerImpl>(
      builder: (_) {
        return Container(
          height: context.screenHeight * .09,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * .06),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.changeCurrentIndex(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == controller.currentIndex
                            ? context.screenHeight * .060
                            : 30,
                        width: index == controller.currentIndex
                            ? context.screenWidth * .250
                            : 30,
                        decoration: BoxDecoration(
                          color: index == controller.currentIndex
                              ? Colors.blueAccent.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(70),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          fit: BoxFit.fill,
                          AppConstant.listOfCompanyIcons[index],
                          width: index == controller.currentIndex
                              ? 25.0.w
                              : 20.0.w,
                          colorFilter: index == controller.currentIndex
                              ? const ColorFilter.mode(
                                  Color(0xFF364FD4),
                                  BlendMode.srcIn,
                                )
                              : const ColorFilter.mode(
                                  Color(0xFFB9C1CC),
                                  BlendMode.srcIn,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomItemsListView extends StatelessWidget {
  CustomItemsListView({super.key});

  final HomeScreenControllerImpl controller =
      Get.put(HomeScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (_) {
        return SizedBox(
          height: 100.0.h,
          width: 430.0.w,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              return buildItemCard(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.0.w,
              );
            },
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  Widget buildItemCard(int index) {
    ProductControllerImpl productControllerImpl =
        Get.put(ProductControllerImpl());
    return GestureDetector(
      onTap: () async {
        await productControllerImpl.getProductsWithinCategory(
          categoryId: controller.categories[index].id.toString(),
        );
        Get.toNamed(AppRoutes.products,
            arguments: {"category": controller.categories[index]});
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.5), width: 0.5),
            borderRadius: BorderRadius.circular(10.0)),
        width: 80.w,
        height: 80.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              '${AppLinksApi.apiImages}/${controller.categories[index].image}',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                "${controller.categories[index].name}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12.5,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomExpandedProductListView extends StatelessWidget {
  CustomExpandedProductListView({super.key});

  final HomeScreenControllerImpl controller =
      Get.put(HomeScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (_) {
        return SizedBox(
          height: 240.0.h,
          width: 800.0.w,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return buildExpandedProductCard(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.0.w,
              );
            },
            itemCount: controller.mostSalesProducts.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  Widget buildExpandedProductCard(int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
          arguments: {
            'product': controller.mostSalesProducts[index],
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        width: 180.w,
        height: 240.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${AppLinksApi.apiImages}/${controller.mostSalesProducts[index].image}',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset(
                //       AppAssets.heart,
                //       colorFilter: const ColorFilter.mode(
                //           AppColors.redColor, BlendMode.srcIn),
                //     ))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  controller.mostSalesProducts[index].name ?? "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "\$ ${controller.mostSalesProducts[index].newPrice}",
                  style: ThemeHelper(Get.context!)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0),
                  child: SizedBox(
                    height: 13.0,
                    width: 13.0,
                    child: SvgPicture.asset(
                      AppAssets.star,
                      fit: BoxFit.fill,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFFFDC34E), BlendMode.srcIn),
                    ),
                  ),
                ),
                Text(
                  controller.mostSalesProducts[index].viewer.toString(),
                  style: ThemeHelper(Get.context!)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF828B9A)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMiniProductListView extends StatelessWidget {
  CustomMiniProductListView({super.key});

  final HomeScreenControllerImpl controller =
      Get.put(HomeScreenControllerImpl());
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (_) {
        return SizedBox(
          height: 100.0.h,
          width: 800.0.w,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              return buildExpandedProductCard(index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.0.w,
              );
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  Widget buildExpandedProductCard(int index) {
    CartScreenControllerImpl cartScreenControllerImpl =
        Get.put(CartScreenControllerImpl());
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
          arguments: {
            'product': controller.mostPapularProducts[index],
          },
        );
      },
      child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          width: 255.w,
          height: 180.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                    imageUrl:
                        '${AppLinksApi.apiImages}/${controller.mostPapularProducts[index].image}',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.mostPapularProducts[index].name ?? "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ ${controller.mostPapularProducts[index].newPrice}",
                      overflow: TextOverflow.ellipsis,
                      style: ThemeHelper(Get.context!)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (myServices.sharedPreferences.getString("type") == "user")
                Container(
                  width: 30.0.w,
                  height: 30.0.h,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: IconButton(
                      onPressed: () {
                        cartScreenControllerImpl
                            .addProduct(controller.mostPapularProducts[index]);
                      },
                      icon: SvgPicture.asset(
                        AppAssets.plus,
                        fit: BoxFit.fill,
                        colorFilter: const ColorFilter.mode(
                            AppColors.whiteColor, BlendMode.srcIn),
                      )),
                )
            ],
          )),
    );
  }
}

// class CustomListView extends StatelessWidget {
//   CustomListView({super.key});

//   final ListViewProfilesControllerImpl controller =
//       Get.put(ListViewProfilesControllerImpl());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ListViewProfilesControllerImpl>(
//       builder: (_) {
//         return SizedBox(
//           height: 500.0.h,
//           width: 400.0.w,
//           child: ListView.separated(
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return buildCard(itemsCardHome[index]);
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 height: 50.0.w,
//               );
//             },
//             itemCount: itemsCardHome.length,
//             scrollDirection: Axis.vertical,
//           ),
//         );
//       },
//     );
//   }

//   Widget buildCard(ItemCardHome itemCardHome) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           width: 74.w,
//           height: 74.h,
//           decoration: BoxDecoration(
//               color: AppColors.lightGrayFourColor,
//               borderRadius: BorderRadius.circular(25.0)),
//           child: SvgPicture.asset(
//             itemCardHome.image ?? "",
//             width: 29.55.w,
//             height: 25.h,
//           ),
//         ),
//         const SizedBox(width: 10.0),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               itemCardHome.title ?? "",
//               style:
//                   const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               itemCardHome.subTitle ?? "",
//               style:
//                   const TextStyle(fontSize: 20.0, color: AppColors.grayColor),
//             )
//           ],
//         ),
//         const Spacer(),
//         Container(
//             alignment: Alignment.center,
//             width: 50.0,
//             height: 50.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppConstant.appRadius),
//                 gradient: const LinearGradient(
//                     colors: AppColors.linerLightBlueColor,
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight)),
//             child: Text(
//               itemCardHome.number ?? "",
//               style:
//                   const TextStyle(fontSize: 25.0, color: AppColors.whiteColor),
//             )),
//       ],
//     );
//   }
// }

class HeadText2 extends StatelessWidget {
  final String text;
  const HeadText2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(color: AppColors.primaryColor),
    );
  }
}

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16.0)),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'أهلاً, محمد أحمد',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.account),
            SizedBox(
              width: 16.0.w,
            ),
            Image.asset(AppAssets.account),
          ],
        ),
      ],
    );
  }
}

class AddPhotoComponent extends StatefulWidget {
  final File? image;
  final void Function()? onPressedPickImage;

  const AddPhotoComponent(
      {super.key, required this.image, required this.onPressedPickImage});

  @override
  State<AddPhotoComponent> createState() => _AddPhotoComponentState();
}

class _AddPhotoComponentState extends State<AddPhotoComponent> {
  late Widget svg = widget.image != null
      ? Image.file(
          widget.image!,
          fit: BoxFit.fill,
          width: 50.0,
          height: 150.0,
        )
      : SvgPicture.asset(
          AppAssets.account,
          fit: BoxFit.none,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: widget.image != null
                  ? Image.file(
                      widget.image!,
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 150.0,
                    )
                  : Icon(
                      Icons.account_circle_outlined,
                      size: 60.0,
                      color: AppColors.greyColor.withOpacity(0.4),
                    )),
        ),
        Transform.translate(
          offset: Offset(2.0.w, 2.0.h),
          child: CircleAvatar(
            radius: 15.0,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: widget.onPressedPickImage,
              icon: Icon(
                Icons.add,
                color: AppColors.whiteColor.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddProductPhotoComponent extends StatelessWidget {
  final File? image;
  final void Function()? onPressedPickImage;
  // late Widget svg = image != null
  //     ? Image.file(
  //         image!,
  //         fit: BoxFit.fill,
  //         width: 50.0,
  //         height: 150.0,
  //       )
  //     : SvgPicture.asset(
  //         AppAssets.account,
  //         fit: BoxFit.none,
  //       );

  const AddProductPhotoComponent(
      {super.key, required this.image, required this.onPressedPickImage});
  @override
  Widget build(BuildContext context) {
    //IconData ImageSelectIcon = Icons.add;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        image != null
            ? Container(
                height: 150.0.h,
                width: 150.0.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.grey7Color,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 150.0,
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.grey7Color,
                ),
                height: 150.0.h,
                width: 150.0.w,
                child: SvgPicture.asset(
                  AppAssets.addProductPhoto,
                  fit: BoxFit.none,
                  height: 60.0,
                  width: 60.0,
                  colorFilter: const ColorFilter.mode(
                      AppColors.grey3Color, BlendMode.srcIn),
                )),
        Transform.translate(
          offset: Offset(7.0.w, 7.0.h),
          child: CircleAvatar(
            radius: 15.0,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: onPressedPickImage,
              icon: Icon(
                Icons.add,
                color: AppColors.whiteColor.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearch extends StatelessWidget {
  CustomSearch({super.key});
  final ProductControllerImpl controller = Get.put(ProductControllerImpl());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              width: 335.0,
              height: 65.0,
              decoration: BoxDecoration(
                  color: const Color(0xFFF0F3F8),
                  borderRadius: BorderRadius.circular(12.0)),
              child: CustomTextFormFieldv2(
                  iconPrifixIcon: AppAssets.search,
                  iconDataPrifixColor: AppColors.greyColor,
                  hintText: "search".tr,
                  textDirection: TextDirection.ltr,
                  iconData: AppAssets.eye,
                  iconDataColor: const Color(0xFFF0F3F8),
                  textEditingController: controller.searchController,
                  validation: (value) {
                    return validationOnInput(
                        value: value!, min: 4, max: 20, type: "search");
                  },
                  keyBoardType: TextInputType.text)),
          GestureDetector(
            onTap: () async {
              await controller.searchProduct(
                  name: controller.searchController.text);
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              height: 65.0,
              width: 65.0,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.0)),
              child: SizedBox(
                child: SvgPicture.asset(AppAssets.search,
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                        AppColors.whiteColor, BlendMode.srcIn)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomPopularProductsListView extends StatelessWidget {
  CustomPopularProductsListView({super.key});

  final HomeScreenControllerImpl controller =
      Get.put(HomeScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (_) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildPopularProductsCard(index);
          },
          itemCount: controller.mostPapularProducts.length,
        );
      },
    );
  }

  Widget buildPopularProductsCard(int index) {
    final CartScreenControllerImpl cartScreenControllerImpl =
        Get.put(CartScreenControllerImpl());
    final MyServices myServices = Get.find();
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
          arguments: {
            'product': controller.mostPapularProducts[index],
          },
        );
      },
      child: Stack(alignment: Alignment.bottomRight, children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                            imageUrl:
                                '${AppLinksApi.apiImages}/${controller.mostPapularProducts[index].image}',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.contain),
                      ),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: SvgPicture.asset(
                      //       AppAssets.heart,
                      //       colorFilter: const ColorFilter.mode(
                      //           AppColors.redColor, BlendMode.srcIn),
                      //     ))
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0),
                            child: SizedBox(
                              height: 13.0,
                              width: 13.0,
                              child: SvgPicture.asset(
                                AppAssets.star,
                                fit: BoxFit.fill,
                                colorFilter: const ColorFilter.mode(
                                    Color(0xFFFDC34E), BlendMode.srcIn),
                              ),
                            ),
                          ),
                          Text(
                            controller.mostPapularProducts[index].viewer
                                .toString(),
                            style: ThemeHelper(Get.context!)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF828B9A)),
                          )
                        ],
                      ),
                      Text(
                        controller.mostPapularProducts[index].name ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${controller.mostPapularProducts[index].newPrice}",
                        style: ThemeHelper(Get.context!)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        if (myServices.sharedPreferences.getString("type") == "user")
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                splashRadius: 25.0,
                color: AppColors.whiteColor,
                iconSize: 15.0,
                onPressed: () {
                  cartScreenControllerImpl.addProduct(
                    controller.mostPapularProducts[index],
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ),
          )
      ]),
    );
  }
}

class CustomProductsWithinCategoryListView extends StatelessWidget {
  CustomProductsWithinCategoryListView({super.key});

  final ProductControllerImpl controller = Get.put(ProductControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImpl>(
      builder: (_) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildProductCard(index);
          },
          itemCount: controller.productsWithinCategory.length,
        );
      },
    );
  }

  Widget buildProductCard(int index) {
    CartScreenControllerImpl cartScreenControllerImpl =
        Get.put(CartScreenControllerImpl());
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
          arguments: {
            'product': controller.productsWithinCategory[index],
          },
        );
      },
      child: Stack(alignment: Alignment.bottomRight, children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                            imageUrl:
                                '${AppLinksApi.apiImages}/${controller.productsWithinCategory[index].image}',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.contain),
                      ),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: SvgPicture.asset(
                      //       AppAssets.heart,
                      //       colorFilter: const ColorFilter.mode(
                      //           AppColors.redColor, BlendMode.srcIn),
                      //     ))
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0),
                            child: SizedBox(
                              height: 13.0,
                              width: 13.0,
                              child: SvgPicture.asset(
                                AppAssets.star,
                                fit: BoxFit.fill,
                                colorFilter: const ColorFilter.mode(
                                    Color(0xFFFDC34E), BlendMode.srcIn),
                              ),
                            ),
                          ),
                          Text(
                            controller.productsWithinCategory[index].viewer
                                .toString(),
                            style: ThemeHelper(Get.context!)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF828B9A)),
                          )
                        ],
                      ),
                      Text(
                        controller.productsWithinCategory[index].name ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${controller.productsWithinCategory[index].newPrice}",
                        style: ThemeHelper(Get.context!)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
                color: AppColors.primaryColor, shape: BoxShape.circle),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 10.0,
              color: AppColors.whiteColor,
              iconSize: 20.0,
              onPressed: () {
                cartScreenControllerImpl
                    .addProduct(controller.productsWithinCategory[index]);
              },
              icon: SvgPicture.asset(
                AppAssets.plus,
                height: 18.0,
                width: 18.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class CustomSearchProductsListView extends StatelessWidget {
  CustomSearchProductsListView({super.key});

  final ProductControllerImpl controller = Get.put(ProductControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImpl>(
      builder: (_) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildSearchProductsCard(index);
          },
          itemCount: controller.searchProducts.length,
        );
      },
    );
  }

  Widget buildSearchProductsCard(int index) {
    final CartScreenControllerImpl cartScreenControllerImpl =
        Get.put(CartScreenControllerImpl());
    final MyServices myServices = Get.find();
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
          arguments: {
            'product': controller.searchProducts[index],
          },
        );
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                            imageUrl:
                                '${AppLinksApi.apiImages}/${controller.searchProducts[index].image}',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.contain),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: SvgPicture.asset(
                      //     AppAssets.heart,
                      //     colorFilter: const ColorFilter.mode(
                      //       AppColors.redColor,
                      //       BlendMode.srcIn,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0),
                            child: SizedBox(
                              height: 13.0,
                              width: 13.0,
                              child: SvgPicture.asset(
                                AppAssets.star,
                                fit: BoxFit.fill,
                                colorFilter: const ColorFilter.mode(
                                    Color(0xFFFDC34E), BlendMode.srcIn),
                              ),
                            ),
                          ),
                          Text(
                            controller.searchProducts[index].viewer.toString(),
                            style: ThemeHelper(Get.context!)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF828B9A)),
                          )
                        ],
                      ),
                      Text(
                        controller.searchProducts[index].name ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${controller.searchProducts[index].newPrice}",
                        style: ThemeHelper(Get.context!)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (myServices.sharedPreferences.getString("type") == "user")
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  splashRadius: 25.0,
                  color: AppColors.whiteColor,
                  iconSize: 15.0,
                  onPressed: () {
                    cartScreenControllerImpl.addProduct(
                      controller.searchProducts[index],
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class CustomReviewWidget extends StatelessWidget {
  final String? userName;
  final String? date;
  final String? image;
  final String? content;
  final int? numOfStars;
  const CustomReviewWidget(
      {super.key,
      required this.userName,
      required this.date,
      required this.image,
      required this.content,
      required this.numOfStars});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.r)),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: 200.h,
        width: 560.0.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    image!,
                    fit: BoxFit.fill,
                  )
                ],
              ),
              const SizedBox(
                width: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.ltr,
                        children: [
                          Text(
                            "$userName",
                            style: ThemeHelper(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 50.0,
                            height: 10.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  SvgPicture.asset(AppAssets.star),
                              itemCount: numOfStars!,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      "$date",
                      style: ThemeHelper(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: AppColors.grey2Color,
                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      "$content",
                      textDirection: TextDirection.ltr,
                      style: ThemeHelper(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(
                              color: AppColors.grey4Color,
                              fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

class CustomNotifyWidget extends StatelessWidget {
  final String? title;
  final String? date;
  final String? image;
  final String? subtitle;
  const CustomNotifyWidget({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.r)),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: 150.h,
        width: 560.0.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 70.0.h,
                    width: 70.0.w,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15.0.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(
                        image!,
                        height: 40.0.h,
                        width: 40.0.w,
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                            AppColors.whiteColor, BlendMode.srcIn),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250.0,
                          child: Text(
                            "$title",
                            textAlign: TextAlign.start,
                            style: ThemeHelper(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.0.h,
                          width: 10.0.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      "$subtitle",
                      style: ThemeHelper(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(
                              color: AppColors.grey4Color,
                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      "$date",
                      style: ThemeHelper(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(
                              color: AppColors.grey2Color,
                              fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

class SettingsBar extends StatelessWidget {
  final String? image;
  final String? title;
  final Function()? function;
  const SettingsBar(
      {super.key,
      required this.image,
      required this.title,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0.r),
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0.h,
        width: 400.0.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.0.h,
              width: 50.0.w,
              decoration: BoxDecoration(
                  color: AppColors.grey7Color,
                  borderRadius: BorderRadius.circular(10.0.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  image!,
                  height: 30.0.h,
                  width: 30.0.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 15.0.w,
            ),
            Text(
              title!,
              style: ThemeHelper(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            SvgPicture.asset(AppAssets.rightArrow)
          ],
        ),
      ),
    );
  }
}

class CustomCartWidget extends StatelessWidget {
  final CartScreenController cartController;
  final Product product;
  final int quantity;
  final int index;
  CustomCartWidget({
    super.key,
    required this.cartController,
    required this.product,
    required this.quantity,
    required this.index,
  });
  final CartScreenControllerImpl controller =
      Get.put(CartScreenControllerImpl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartScreenControllerImpl>(
      builder: (_) {
        return Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.r)),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: 180.h,
            width: 550.0.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.productDetails,
                      arguments: {"product": product},
                    );
                  },
                  child: Container(
                    height: 75.0.h,
                    width: 75.0.w,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15.0.r)),
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
                const SizedBox(
                  width: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250.0.w,
                        child: Row(
                          children: [
                            Text(
                              product.name ?? "",
                              style: ThemeHelper(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            const Spacer(),
                            InkWell(
                              splashColor:
                                  AppColors.primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.0.r),
                              child: SvgPicture.asset(
                                AppAssets.delete,
                                height: 22.0.h,
                                width: 20.0.w,
                                fit: BoxFit.fill,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.grey4Color,
                                  BlendMode.srcIn,
                                ),
                              ),
                              onTap: () {
                                controller.removeProduct(product);
                              },
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 250.0.w,
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.removeProduct(product);
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        color: controller.focusColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                    " $quantity ",
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
                                    controller.addProduct(product);
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        color: AppColors.grey3Color,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: SvgPicture.asset(AppAssets.plus),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "\$${product.newPrice}",
                                style: ThemeHelper(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 30.0.sp,
                                        fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
