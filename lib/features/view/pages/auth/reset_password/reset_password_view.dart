import '../../../../../core/class/handling_data_show/handling_data_show.dart';
import '../../../../../core/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/functions/validation_on_input/validation_on_input.dart';
import '../../../../../core/shared/extentions/extentions.dart';

import '../../../../../core/constant/app_assets/app_assets.dart';
import '../../../../../core/shared/widgets/widgets_v1.dart';
import '../../../../controller/auth/auth_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final AuthControllerImpl controller = Get.put(AuthControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthControllerImpl>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: AppColors.whiteColor,
              title: Text("Reset Password",
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
            backgroundColor: AppColors.whiteColor,
            body: GetBuilder<AuthControllerImpl>(
              builder: (_) {
                return Form(
                  key: controller.formKey5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Code",
                                style:
                                    ThemeHelper(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextFormField(
                            hintText: "code",
                            textEditingController:
                                controller.codeNumberController,
                            validation: (value) {
                              return validationOnInput(
                                value: value!,
                                min: 6,
                                max: 6,
                              );
                            },
                            keyBoardType: TextInputType.number,
                            textDirection: TextDirection.ltr,
                            iconData: AppAssets.check,
                            iconDataColor: AppColors.primaryColor,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "password".tr,
                                style:
                                    ThemeHelper(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextFormField(
                            obscureText: controller.isShowPassword,
                            onTapSuffix: () {
                              controller.showPassword();
                              controller.changeColor();
                            },
                            hintText: "password".tr,
                            textEditingController:
                                controller.passwordController,
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
                            iconDataColor: controller.suffixColorIcon,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "password Confirm",
                                style:
                                    ThemeHelper(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextFormField(
                            obscureText: controller.isShowConfirmNewPassword,
                            onTapSuffix: () {
                              controller.showConfirmPassword();
                              controller.changeConfirmColor();
                            },
                            hintText: "password confirm",
                            textEditingController:
                                controller.passwordConfirmController,
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
                            iconDataColor: controller.suffixConfirmColorIcon,
                          ),
                          const SizedBox(
                            height: 80.0,
                          ),
                          HandlingDataShow(
                            statusRequest: controller.statusRequest,
                            widget: CustomButton(
                              childWidget: Center(
                                child: Text(
                                  "Reset",
                                  style: ThemeHelper(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize: 25.0),
                                ),
                              ),
                              onTapButton: () async {
                                await controller.resetPassword(
                                  code: controller.codeNumberController.text
                                      .trim(),
                                  password:
                                      controller.passwordController.text.trim(),
                                  passwordConfirm: controller
                                      .passwordConfirmController.text
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
          );
        },
      ),
    );
  }
}
