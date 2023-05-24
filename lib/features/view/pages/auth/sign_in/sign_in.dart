import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:eshop_app/features/view/pages/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors/colors.dart';
import '../../../../../core/shared/widgets/widgets.dart';
import '../../../../controller/auth/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthControllerImpl controller = Get.put(AuthControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthControllerImpl>(
        builder: (_) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password?",
                              style: ThemeHelper(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 15.0,
                                      color: const Color(0xFF828B9A)),
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80.0,
                ),
                CustomButton(
                    childWidget: Center(
                      child: Text(
                        "Sign In",
                        style: ThemeHelper(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: AppColors.whiteColor, fontSize: 25.0),
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
                    Expanded(
                      flex: 1,
                      child: const Divider(
                        color: AppColors.grayColor,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Or sign in with",
                      style: ThemeHelper(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color: const Color(0xFF828B9A), fontSize: 20.0),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        flex: 1,
                        child: const Divider(color: AppColors.grayColor)),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2.5, color: const Color(0xFFE4E9ED))),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppAssets.facebookIcon,
                              fit: BoxFit.fill),
                          label: Text(
                            "Facebook",
                            style: ThemeHelper(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: const Color(0xFF5C6574)),
                          )),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2.5, color: const Color(0xFFE4E9ED))),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppAssets.googleIcon,
                              fit: BoxFit.fill),
                          label: Text(
                            "Google",
                            style: ThemeHelper(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: const Color(0xFF5C6574)),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150.0,
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
                          Get.to(SignUpScreen());
                        },
                        child: Text("Sign Up",
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
        title: Text("Sign In",
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
  }
}
