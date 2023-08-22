import 'package:eshop_app/core/class/handling_data_show/handling_data_show.dart';
import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/functions/validation_on_input/validation_on_input.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:eshop_app/features/controller/account/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors/colors.dart';
import '../../../../../core/shared/widgets/widgets_v1.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final AccountScreenControllerImpl controller =
      Get.put(AccountScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AccountScreenControllerImpl>(
        builder: (_) {
          return Form(
            key: controller.formKey1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Current Password",
                          style: ThemeHelper(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText: "current password",
                      obscureText: controller.isShowCurrentPassword,
                      onTapSuffix: () {
                        controller.showCurrentPassword();
                        controller.changeCurrentColor();
                      },
                      textEditingController:
                          controller.currentpasswordController,
                      validation: (value) {
                        return validationOnInput(
                          value: value!,
                          min: 8,
                          max: 30,
                          type: "Password",
                        );
                      },
                      keyBoardType: TextInputType.visiblePassword,
                      textDirection: TextDirection.ltr,
                      iconData: AppAssets.eye,
                      iconDataColor: controller.suffixColorCurrentIcon,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "New Password",
                          style: ThemeHelper(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText: "new password",
                      obscureText: controller.isShowNewPassword,
                      onTapSuffix: () {
                        controller.showNewPassword();
                        controller.changeNewColor();
                      },
                      textEditingController: controller.newpasswordController,
                      validation: (value) {
                        return validationOnInput(
                          value: value!,
                          min: 8,
                          max: 30,
                          type: "Password",
                        );
                      },
                      keyBoardType: TextInputType.visiblePassword,
                      textDirection: TextDirection.ltr,
                      iconData: AppAssets.eye,
                      iconDataColor: controller.suffixColorNewIcon,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "New Password Confirmation",
                          style: ThemeHelper(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText: "new password confirmation",
                      obscureText: controller.isShowNewConfirmPassword,
                      onTapSuffix: () {
                        controller.showNewConfirmPassword();
                        controller.changeNewConfirmColor();
                      },
                      textEditingController:
                          controller.newpasswordConfirmationController,
                      validation: (value) {
                        return validationOnInput(
                          value: value!,
                          min: 8,
                          max: 30,
                          type: "Password",
                        );
                      },
                      keyBoardType: TextInputType.visiblePassword,
                      textDirection: TextDirection.ltr,
                      iconData: AppAssets.eye,
                      iconDataColor: controller.suffixColorNewConfirmIcon,
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                    HandlingDataShow(
                      statusRequest: controller.statusRequest,
                      widget: CustomButton(
                        childWidget: Center(
                          child: Text(
                            "Change",
                            style: ThemeHelper(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: 25.0),
                          ),
                        ),
                        onTapButton: () async {
                          await controller.changePassword(
                            currentPassword: controller
                                .currentpasswordController.text
                                .trim(),
                            newPassword:
                                controller.newpasswordController.text.trim(),
                            newConfirmPassword: controller
                                .newpasswordConfirmationController.text
                                .trim(),
                          );
                        },
                        colorButton: AppColors.primaryColor,
                        heightButton: 70,
                        widthButton: 380,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        title: Text("Change your password",
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
            Get.back();
          },
        ),
      ),
    );
  }
}
