import 'package:eshop_app/features/view/pages/get_first_page/get_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class OnBoardingController extends GetxController {
  movingPage(bool isMoving);
  nextPage();
}

class OnBoardingControllerImpl extends OnBoardingController {
  PageController boardingController = PageController();
  bool isMove = false;

  @override
  movingPage(bool isMoving) {
    isMove = isMoving;
    update();
  }

  @override
  void nextPage() {
    // CacheHelper.saveData(key: "onBoarding", value: true).then((bool? value) {
    //   if (value!) {
    //     navigateAndFinish(
    //       context,
    //       const ShopLoginScreen(),
    //     );
    //   }
    // });
    Get.to(const GetFirstPageView());
  }
}
