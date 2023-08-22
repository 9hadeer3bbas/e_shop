import 'package:eshop_app/features/view/pages/get_first_page/get_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors/colors.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/shared/extentions/extentions.dart';
import '../../../../core/shared/widgets/widgets_v1.dart';
import '../../../controller/on_boarding/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/data_source/local/on_boarding/on_boarding.dart';
import '../../../data/models/on_boarding/on_boarding.dart';
import '../../widgets/on_boarding/custom_on_boarding_item.dart';

class OnBoardingArabicView extends StatelessWidget {
  OnBoardingArabicView({super.key});

  final OnBoardingControllerImpl controller =
      Get.put(OnBoardingControllerImpl());

  

  @override
  Widget build(BuildContext context) {
    OnBoarding onBoarding = OnBoarding(title: "www");
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: GetBuilder<OnBoardingControllerImpl>(
          builder: (_) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: controller.boardingController,
                      padEnds: false,
                      onPageChanged: (int index) {
                        if (index == boardingAr.length - 1) {
                          controller.movingPage(true);
                        } else {
                          controller.movingPage(false);
                        }
                      },
                      itemBuilder: (context, index) {
                        onBoarding = boardingAr[index];
                        return CustomOnBoardingItem(
                          onBoarding: onBoarding,
                        );
                      },
                      itemCount: boardingAr.length,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: AppColors.primaryColor),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              if (controller.isMove) {
                                controller.nextPage();
                              } else {
                                controller.boardingController.nextPage(
                                  duration: 750.milliseconds,
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              }
                            },
                            child: Center(
                                child: Text(
                              "التالي",
                              style: ThemeHelper(Get.context!)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: AppConstant.fontSizeTwenty,
                                  ),
                            )),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SmoothPageIndicator(
                        controller: controller.boardingController,
                        effect: ExpandingDotsEffect(
                          dotColor: AppColors.lightGrayThreeColor,
                          activeDotColor: AppColors.primaryColor,
                          dotHeight: 16.0.h,
                          dotWidth: 16.0.w,
                          expansionFactor: 4.w,
                          spacing: 40.0.w,
                        ),
                        count: boardingAr.length,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: onBoarding.title != null
                            ? InkWell(
                                onTap: () {
                                  Get.to(const GetFirstPageView());
                                },
                                child: CustomText(
                                  textDirection: TextDirection.rtl,
                                  textData: "تخطي",
                                  textStyles: ThemeHelper(Get.context!)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: AppColors.deepBlueOneColor,
                                        fontSize: AppConstant.fontSizeTwenty,
                                      ),
                                ),
                              )
                            : CustomText(
                                textDirection: TextDirection.rtl,
                                textData: "تخطي",
                                textStyles: ThemeHelper(Get.context!)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: AppConstant.fontSizeTwenty,
                                    ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
