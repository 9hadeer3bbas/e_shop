import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colors/colors.dart';
import '../../../../core/constant/constant.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import '../../../../core/shared/extentions/extentions.dart';

class BuildCustomButtonItem extends StatelessWidget {
  final String text;
  final Color colorText;
  final Color colorButton;
  final void Function() onTapButton;
  const BuildCustomButtonItem({
    super.key,
    required this.text,
    required this.colorText,
    required this.colorButton,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.w),
      child: CustomButton(
        childWidget: Center(
          child: CustomText(
            textData: text,
            textStyles: ThemeHelper(context).textTheme.headlineLarge!.copyWith(
                  fontSize: AppConstant.fontSizeTwenty,
                  color: colorText,
                ),
            textDirection: TextDirection.rtl,
          ),
        ),
        onTapButton: onTapButton,
        colorButton: colorButton,
        splashColorButton: AppColors.secondaryColor,
        heightButton: AppConstant.heightButtonSixty,
        widthButton: AppConstant.widthButtonThreeHandred,
      ),
    );
  }
}
