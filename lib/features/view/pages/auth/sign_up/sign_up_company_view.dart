import 'dart:developer';

import 'package:eshop_app/core/class/handling_data_show/handling_data_show.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/services/services.dart';
import 'package:eshop_app/features/view/pages/auth/sign_in/sign_in.dart';
import 'package:eshop_app/features/view/pages/get_first_page/get_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

import '../../../../../core/constant/app_assets/app_assets.dart';
import '../../../../../core/functions/validation_on_input/validation_on_input.dart';
import '../../../../../core/shared/widgets/widgets_v1.dart';
import '../../../../controller/auth/auth_controller.dart';

class SignUpScreenCompany extends StatelessWidget {
  SignUpScreenCompany({super.key});
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController registrationNoController =
      TextEditingController();
  final AuthControllerImpl controller = Get.put(AuthControllerImpl());
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControllerImpl>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: AppColors.whiteColor,
            title: Text("continue as company".tr,
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
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Column(
                  children: [
                    Form(
                      key: controller.formKey3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "owner".tr,
                                style:
                                    ThemeHelper(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextFormField(
                            hintText: "owner name".tr,
                            textEditingController: ownerNameController,
                            validation: (value) {
                              return validationOnInput(
                                  value: value!,
                                  min: 2,
                                  max: 20,
                                  type: "FirstName");
                            },
                            keyBoardType: TextInputType.name,
                            iconData: AppAssets.check,
                            iconDataColor: const Color(0xFFF0F3F8),
                          ),
                          const SizedBox(height: 50.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "commercial registration number".tr,
                                style:
                                    ThemeHelper(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextFormField(
                            hintText: "commercial registration number".tr,
                            textEditingController: registrationNoController,
                            validation: (value) {
                              return validationOnInput(
                                value: value!,
                                min: 6,
                                max: 6,
                              );
                            },
                            keyBoardType: TextInputType.number,
                            iconData: AppAssets.check,
                            iconDataColor: const Color(0xFFF0F3F8),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomButton(
                            childWidget: Center(
                              child: Text(
                                "Check",
                                style: ThemeHelper(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 25.0),
                              ),
                            ),
                            onTapButton: () async {
                              await controller.companyConfirmCode(
                                  companyName:
                                      controller.firstNameController.text,
                                  code: registrationNoController.text);
                            },
                            colorButton: AppColors.primaryColor,
                            heightButton: 70,
                            widthButton: 380,
                          ),
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
                                    color: AppColors.whiteColor,
                                    fontSize: 25.0),
                          ),
                        ),
                        onTapButton: () async {
                          log(myServices.sharedPreferences
                              .getString("is_confirmed")!);
                          await controller.signUpCompany(
                              type: 'company',
                              owner: ownerNameController.text,
                              isConfirmed: myServices.sharedPreferences
                                  .getString("is_confirmed")!);
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
              );
            },
          ),
        );
      },
    );
  }
}
