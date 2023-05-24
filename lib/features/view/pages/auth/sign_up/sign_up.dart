import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/features/view/pages/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

import '../../../../../core/constant/app_assets/app_assets.dart';
import '../../../../../core/shared/widgets/widgets.dart';
import '../../../../controller/auth/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController userFirstNameController = TextEditingController();
  final TextEditingController userLastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final AuthControllerImpl controller = Get.put(AuthControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthControllerImpl>(
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: GetBuilder<AuthControllerImpl>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: ThemeHelper(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: "First Name",
                        textEditingController: userFirstNameController,
                        validation: (p0) {},
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
                            "Last Name",
                            style: ThemeHelper(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: "Last Name",
                        textEditingController: userLastNameController,
                        validation: (p0) {},
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
                            "Email",
                            style: ThemeHelper(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: "Email Address",
                        textEditingController: emailAddressController,
                        validation: (p0) {},
                        keyBoardType: TextInputType.emailAddress,
                        textDirection: TextDirection.ltr,
                        iconData: AppAssets.check,
                        iconDataColor: const Color(0xFF00CC96),
                      ),
                      const SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: ThemeHelper(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            hintText: "Password",
                            textEditingController: passwordController,
                            validation: (p0) {},
                            keyBoardType: TextInputType.visiblePassword,
                            textDirection: TextDirection.ltr,
                            iconData: AppAssets.eye,
                            iconDataColor: Colors.grey,
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                      CustomButton(
                          childWidget: Center(
                            child: Text(
                              "Sign Up",
                              style: ThemeHelper(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: 25.0),
                            ),
                          ),
                          onTapButton: () {},
                          colorButton: AppColors.primaryColor,
                          heightButton: 70,
                          widthButton: 380),
                      const SizedBox(
                        height: 60.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don’t have an account?",
                              style: ThemeHelper(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Color(0xFFB9C1CC),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300)),
                          TextButton(
                              onPressed: () {
                                Get.to(SignInScreen());
                              },
                              child: Text("Sign In",
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
                );
              },
            ),
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: AppColors.whiteColor,
              title: Text("Sign Up",
                  style: ThemeHelper(context).textTheme.displaySmall!.copyWith(
                      fontSize: 30.0,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500)),
              leading: IconButton(
                icon: SvgPicture.asset(AppAssets.leftArrow,
                    width: 12.0.w,
                    fit: BoxFit.fill,
                    colorFilter: const ColorFilter.mode(
                      AppColors.grayColor,
                      BlendMode.srcIn,
                    )),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
