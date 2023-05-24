import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/app_assets/app_assets.dart';

import '../../../models/on_boarding/on_boarding.dart';

List<OnBoarding> boarding = [
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding1, fit: BoxFit.fill),
    title: 'تخطى',
  ),
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding2, fit: BoxFit.fill),
    title: 'تخطى',
  ),
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding3, fit: BoxFit.fill),
  ),
];
