import 'package:eshop_app/core/class/handling_data_show/handling_data_show.dart';
import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/functions/validation_on_input/validation_on_input.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors/colors.dart';
import '../../../../../core/shared/widgets/widgets_v1.dart';
import '../../../../controller/auth/auth_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final AuthControllerImpl controller = Get.put(AuthControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthControllerImpl>(
        builder: (_) {
          return Form(
            key: controller.formKey4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
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
                      textEditingController: controller.emailAddressController,
                      validation: (value) {
                        return validationOnInput(
                          value: value!,
                          min: 6,
                          max: 30,
                          type: "Email",
                        );
                      },
                      keyBoardType: TextInputType.emailAddress,
                      textDirection: TextDirection.ltr,
                      iconData: AppAssets.check,
                      iconDataColor: const Color(0xFFF0F3F8),
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                    HandlingDataShow(
                      statusRequest: controller.statusRequest,
                      widget: CustomButton(
                        childWidget: Center(
                          child: Text(
                            "Sent",
                            style: ThemeHelper(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: 25.0),
                          ),
                        ),
                        onTapButton: () async {
                          await controller.forgetPassword(
                            email:
                                controller.emailAddressController.text.trim(),
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
        title: Text("Forget Password",
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
