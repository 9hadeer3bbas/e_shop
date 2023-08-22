import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_app/core/class/handling_data_show/handling_data_show.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';
import 'package:eshop_app/features/controller/account/account_controller.dart';

import '../../../../core/constant/colors/colors.dart';
import '../../../../core/services/services.dart';
import '../../../../core/shared/widgets/widgets_v1.dart';
import '../../../controller/home/home_controller.dart';
import '../popular/popular_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared/extentions/extentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenControllerImpl controller =
      Get.put(HomeScreenControllerImpl());
  final AccountScreenControllerImpl accountScreenControllerImpl =
      Get.put(AccountScreenControllerImpl());
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<HomeScreenControllerImpl>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hello",
                            style: ThemeHelper(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 35.0.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Transform.translate(
                            offset: const Offset(-13, 20),
                            child: Text(
                              "${accountScreenControllerImpl.myProfile.first.firstName}"
                              " "
                              "${accountScreenControllerImpl.myProfile.first.lastName}",
                              style: ThemeHelper(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color:
                                        AppColors.blackColor.withOpacity(0.3),
                                    fontSize: 22.5.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            "${AppLinksApi.apiImages}/${accountScreenControllerImpl.myProfile.first.imgURL}",
                        imageBuilder: (context, imageProvider) {
                          return SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircleAvatar(
                              backgroundImage: imageProvider,
                            ),
                          );
                        },
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "find your favourite".tr,
                        style: ThemeHelper(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: AppColors.blackColor),
                      ),
                      Text(
                        "product".tr,
                        style: ThemeHelper(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: AppColors.blackColor),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      HandlingDataShow(
                        statusRequest: controller.statusRequest!,
                        widget: CustomSearch(),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
                HandlingDataShow(
                  statusRequest: controller.statusRequest!,
                  widget: CustomItemsListView(),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                HandlingDataShow(
                  statusRequest: controller.statusRequest!,
                  widget: CustomExpandedProductListView(),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "popular".tr,
                      style: ThemeHelper(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(PopularScreen());
                      },
                      child: Text(
                        "view all".tr,
                        style: ThemeHelper(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: const Color(0xFFB9C1CC),
                                fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                HandlingDataShow(
                  statusRequest: controller.statusRequest!,
                  widget: CustomMiniProductListView(),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
