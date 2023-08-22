import 'dart:developer';

import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/features/view/pages/auth/sign_in/sign_in.dart';
import 'package:eshop_app/features/view/pages/get_first_page/get_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:intl/intl.dart';

import '../../../../../core/class/handling_data_show/handling_data_show.dart';
import '../../../../../core/constant/app_assets/app_assets.dart';
import '../../../../../core/shared/widgets/widgets_v1.dart';
import '../../../../controller/auth/auth_controller.dart';

class SignUpScreenUser extends StatelessWidget {
  SignUpScreenUser({super.key});

  final AuthControllerImpl controller = Get.put(AuthControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        title: Text("continue as user".tr,
            style: ThemeHelper(context).textTheme.displaySmall!.copyWith(
                fontSize: 30.0,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.leftArrow,
              width: 12.0.w,
              fit: BoxFit.fill,
              colorFilter: const ColorFilter.mode(
                AppColors.greyColor,
                BlendMode.srcIn,
              )),
          onPressed: () {
            Get.offAll(const GetFirstPageView());
          },
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthControllerImpl>(
        builder: (_) {
          String birthDate = DateFormat("yyyy-MM-dd")
              .format(controller.selectedDate)
              .toString();
          return Form(
            key: controller.formKey3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  AddPhotoComponent(
                    image: controller.imageTemporary,
                    onPressedPickImage: () async {
                      await controller.pickImage();
                    },
                  ),
                  const SizedBox(height: 100.0),
                  Text(
                    "choose your gender".tr,
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
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      hint: Text("gender".tr),
                      alignment: Alignment.center,
                      focusColor: AppColors.greyColor.withOpacity(0.5),
                      value: controller.dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 15,
                      style: ThemeHelper(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: AppColors.blackColor, fontSize: 23.0),
                      decoration: InputDecoration(
                          fillColor: AppColors.primaryColor.withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.primaryColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.primaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.primaryColor))),
                      onChanged: (String? value) {
                        controller.onChangedGender(value);
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      items: AuthControllerImpl.list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              value.isEmpty ? Text("gender".tr) : Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 100.0),
                  Text(
                    "choose your date of birth".tr,
                    style: ThemeHelper(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                            fontSize: 22.5,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            birthDate,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              size: 25.0,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () async {
                              await controller.chooseDate(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  HandlingDataShow(
                    statusRequest: controller.statusRequest,
                    widget: CustomButton(
                      childWidget: Center(
                        child: Text(
                          "sign up".tr,
                          style: ThemeHelper(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: AppColors.whiteColor, fontSize: 25.0),
                        ),
                      ),
                      onTapButton: () async {
                        await controller.signUpUser(
                          birthday: birthDate,
                          gender: controller.dropdownValue,
                          image: controller.imageTemporary,
                          type: "user",
                        );
                        log(controller.firstNameController.text);
                      },
                      colorButton: AppColors.primaryColor,
                      heightButton: 70,
                      widthButton: 380,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("already have an account?".tr,
                          style: ThemeHelper(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: const Color(0xFFB9C1CC),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300)),
                      TextButton(
                          onPressed: () {
                            Get.to(SignInScreen());
                          },
                          child: Text("sign in".tr,
                              style: ThemeHelper(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400)))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
