import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/app_assets/app_assets.dart';

import '../../../models/on_boarding/on_boarding.dart';

List<OnBoarding> boardingEn = [
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding1en, fit: BoxFit.fill),
    title: 'تخطى',
  ),
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding2en, fit: BoxFit.fill),
    title: 'تخطى',
  ),
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding3en, fit: BoxFit.fill),
  ),
];
List<OnBoarding> boardingAr = [
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding1ar, fit: BoxFit.fill),
    title: 'تخطى',
  ),
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding2ar, fit: BoxFit.fill),
    title: 'تخطى',
  ),
  OnBoarding(
    image: SvgPicture.asset(AppAssets.onBoarding3ar, fit: BoxFit.fill),
  ),
];
