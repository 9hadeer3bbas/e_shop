import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';
import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:eshop_app/features/controller/account/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/shared/widgets/widgets_v1.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AccountScreenControllerImpl controller =
      Get.put(AccountScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountScreenControllerImpl>(
      builder: (_) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 60.0, bottom: 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0.r),
                            border: Border.all(
                                color: AppColors.grey1Color, width: 0.8.w)),
                        height: 80.0.h,
                        width: 80.0.w,
                        child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(50.0.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinksApi.apiImages}/${controller.myProfile.first.imgURL}",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Text(
                        "${controller.myProfile.first.firstName}  ${controller.myProfile.first.lastName}",
                        style: ThemeHelper(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Text("${controller.myProfile.first.email}",
                          style: ThemeHelper(context).textTheme.displayMedium),
                    ],
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.creditCard,
                      title: "Payment Methods",
                      function: () {}),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.account,
                      title: "Account Information",
                      function: () {}),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Divider(
                    color: AppColors.grey3Color,
                    height: 5.0.h,
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.notificationsPadding,
                      title: "Notifications",
                      function: () {}),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.inviteFriend,
                      title: "Invite Friends",
                      function: () {}),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.work,
                      title: "Terms of services",
                      function: () {}),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.settings,
                      title: "Settings",
                      function: () {}),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SettingsBar(
                      image: AppAssets.security,
                      title: "Change Password",
                      function: () {
                        Get.toNamed(AppRoutes.changePassword);
                      }),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Divider(
                    color: AppColors.grey3Color,
                    height: 5.0.h,
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  SettingsBar(
                    image: AppAssets.logout,
                    title: "Logout",
                    function: () async {
                      await controller.logOut();
                    },
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
