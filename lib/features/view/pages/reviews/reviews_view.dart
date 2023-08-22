import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/data/data_source/local/review/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: IconButton(
            splashRadius: 25.0,
            icon: SizedBox(
              height: 18,
              width: 10,
              child: SvgPicture.asset(
                AppAssets.leftArrow,
                fit: BoxFit.fill,
                colorFilter: const ColorFilter.mode(
                    AppColors.grey3Color, BlendMode.srcIn),
              ),
            ),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
        title: const Text("Reviews"),
        actions: [
          IconButton(
              splashRadius: 25.0,
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  AppAssets.cart,
                  fit: BoxFit.fill,
                  colorFilter: const ColorFilter.mode(
                      AppColors.grey3Color, BlendMode.srcIn),
                ),
              ),
              onPressed: () {}),
          const SizedBox(
            width: 8.0,
          ),
        ],
        titleTextStyle: ThemeHelper(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 28.0, fontWeight: FontWeight.w600),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomReviewWidget(
                userName: reviews[0].userName,
                date: reviews[0].date,
                image: reviews[0].image,
                content: reviews[0].content,
                numOfStars: reviews[0].numOfStars,
              ),
              SizedBox(
                height: 10.0.h,
              ),
              CustomReviewWidget(
                userName: reviews[1].userName,
                date: reviews[1].date,
                image: reviews[1].image,
                content: reviews[1].content,
                numOfStars: reviews[1].numOfStars,
              ),
              SizedBox(
                height: 10.0.h,
              ),
              CustomReviewWidget(
                userName: reviews[2].userName,
                date: reviews[2].date,
                image: reviews[2].image,
                content: reviews[2].content,
                numOfStars: reviews[2].numOfStars,
              ),
              SizedBox(
                height: 10.0.h,
              ),
              CustomReviewWidget(
                userName: reviews[3].userName,
                date: reviews[3].date,
                image: reviews[3].image,
                content: reviews[3].content,
                numOfStars: reviews[3].numOfStars,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarUser(),
    );
  }
}
