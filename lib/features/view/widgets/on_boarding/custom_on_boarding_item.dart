import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors/colors.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/shared/extentions/extentions.dart';
import '../../../../core/shared/widgets/widgets.dart';
import '../../../controller/on_boarding/on_boarding_controller.dart';
import '../../../data/models/on_boarding/on_boarding.dart';

class CustomOnBoardingItem extends StatelessWidget {
  final OnBoarding onBoarding;
  CustomOnBoardingItem({super.key, required this.onBoarding});

  final OnBoardingControllerImpl controller =
      Get.put(OnBoardingControllerImpl());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: onBoarding.image,
            ),
          ],
        ),
      ),
    );
  }
}
