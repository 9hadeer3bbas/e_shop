import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/widgets/widgets_v1.dart';
import '../../../../core/shared/extentions/extentions.dart';

class BuildCustomTextItem extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const BuildCustomTextItem({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      textData: text,
      textAlignText: TextAlign.center,
      textStyles: ThemeHelper(Get.context!).textTheme.displayLarge!.copyWith(
            fontSize: fontSize,
            color: color,
          ),
      textDirection: TextDirection.rtl,
    );
  }
}
