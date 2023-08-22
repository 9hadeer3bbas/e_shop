import '../../../../../core/constant/colors/colors.dart';
import '../../../../../core/functions/validation_on_input/validation_on_input.dart';
import '../sign_in/sign_in.dart';
import 'sign_up_company_view.dart';
import 'sign_up_user_view.dart';
import '../../get_first_page/get_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/shared/extentions/extentions.dart';

import '../../../../../core/constant/app_assets/app_assets.dart';
import '../../../../../core/shared/widgets/widgets_v1.dart';
import '../../../../controller/auth/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthControllerImpl controller = Get.put(AuthControllerImpl());

  final String companyType = "company";

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
              title: Text("sign up".tr,
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
                  Get.off(const GetFirstPageView());
                },
              ),
            ),
            backgroundColor: AppColors.whiteColor,
            body: GetBuilder<AuthControllerImpl>(
              builder: (_) {
                return Form(
                  key: controller.formKey2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "first name".tr,
                              style: ThemeHelper(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "first name".tr,
                          textEditingController: controller.firstNameController,
                          validation: (value) {
                            return validationOnInput(
                                value: value!,
                                min: 2,
                                max: 20,
                                type: "FirstName");
                          },
                          keyBoardType: TextInputType.name,
                          textDirection: TextDirection.ltr,
                          iconData: AppAssets.check,
                          iconDataColor: const Color(0xFFF0F3F8),
                        ),
                        const SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "last name".tr,
                              style: ThemeHelper(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "last name".tr,
                          textEditingController: controller.lastNameController,
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              return validationOnInput(
                                  value: value,
                                  min: 2,
                                  max: 20,
                                  type: "LastName");
                            } else {
                              return null;
                            }
                          },
                          keyBoardType: TextInputType.name,
                          textDirection: TextDirection.ltr,
                          iconData: AppAssets.check,
                          iconDataColor: const Color(0xFFF0F3F8),
                        ),
                        const SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "email address".tr,
                              style: ThemeHelper(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "email address".tr,
                          textEditingController:
                              controller.emailAddressController,
                          validation: (value) {
                            return validationOnInput(
                                value: value!, min: 8, max: 30, type: "Email");
                          },
                          keyBoardType: TextInputType.emailAddress,
                          textDirection: TextDirection.ltr,
                          iconData: AppAssets.check,
                          iconDataColor: const Color(0xFFF0F3F8),
                        ),
                        const SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "password".tr,
                              style: ThemeHelper(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                    max: 50,
                                    type: "Password");
                              },
                              keyBoardType: TextInputType.visiblePassword,
                              textDirection: TextDirection.ltr,
                              iconData: AppAssets.eye,
                              iconDataColor: controller.suffixColorIcon,
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomButton(
                            childWidget: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: 30.0,
                                    color: AppColors.whiteColor,
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "continue as user".tr,
                                    style: ThemeHelper(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            onTapButton: () {
                              if (controller.formKey2.currentState!
                                  .validate()) {
                                Get.to(SignUpScreenUser());
                              }
                            },
                            colorButton: AppColors.primaryColor,
                            heightButton: 70,
                            widthButton: 380),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                            childWidget: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.business,
                                    size: 30.0,
                                    color: AppColors.whiteColor,
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "continue as company".tr,
                                    style: ThemeHelper(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            onTapButton: () {
                              if (controller.formKey2.currentState!
                                  .validate()) {
                                Get.to(SignUpScreenCompany());
                              }
                            },
                            colorButton: AppColors.primaryColor,
                            heightButton: 70,
                            widthButton: 380),
                        const SizedBox(
                          height: 60.0,
                        ),
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
                      ]),
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
