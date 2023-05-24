import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/colors/colors.dart';
import '../../constant/constant.dart';
import '../../functions/text_styles/text_styles.dart';

class AppTheme {
  static ThemeData apptheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Tajawal',
      // inputDecorationTheme: InputDecorationTheme(
      //   outlineBorder: BorderSide(
      //     width: AppConstant.appWidthThemeTwo,
      //     color: AppColors.lightGrayThreeColor,
      //   ),
      //   suffixIconColor: AppColors.lightGrayThreeColor,
      //   fillColor: AppColors.whiteColor,
      //   filled: true,
      //   contentPadding: EdgeInsets.only(
      //     bottom: 16.h,
      //     top: 16.h,
      //     right: 16.w,
      //   ),
      //   hintStyle: textStyles(
      //     color: AppColors.grayColor,
      //     fontWeight: FontWeight.w400,
      //     fontSize: AppConstant.fontSizeSixteen,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius:
      //         BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //     borderSide: BorderSide(
      //       width: AppConstant.appWidthThemeTwo,
      //       color: AppColors.lightGrayThreeColor,
      //     ),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius:
      //         BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //     borderSide: BorderSide(
      //       width: AppConstant.appWidthThemeTwo,
      //       color: AppColors.lightGrayThreeColor,
      //     ),
      //   ),
      //   errorBorder: OutlineInputBorder(
      //     borderRadius:
      //         BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //     borderSide: BorderSide(
      //       width: AppConstant.appWidthThemeTwo,
      //       color: AppColors.redColor,
      //     ),
      //   ),
      // ),
      //splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      dividerColor: AppColors.lightGrayFourColor,
      // shadowColor: AppColors.secondaryColor,
      //splashColor: AppColors.secondaryColor,
      //highlightColor: AppColors.secondaryColor,
      //hoverColor: AppColors.secondaryColor,
      hintColor: AppColors.grayColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteThreeColor,
        selectedIconTheme: const IconThemeData(
          color: AppColors.primaryColor,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.primaryColor,
          size: 24,
          opacity: .4,
        ),
        selectedLabelStyle: textStyles(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: AppConstant.fontSizeTen,
        ),
        showSelectedLabels: true,
      ),
      cardColor: AppColors.whiteColor,
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.whiteColor,
        elevation: 3.h,
        titleTextStyle: textStyles(
          color: AppColors.primaryColor,
          fontSize: AppConstant.fontSizeTwenty,
          fontWeight: FontWeight.w500,
        ),
        contentTextStyle: textStyles(
          color: AppColors.primaryColor,
          fontSize: AppConstant.fontSizeEighteen,
          fontWeight: FontWeight.w400,
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, .25),
        shape: BeveledRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstant.appRadius)),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeTwentyFour,
            fontWeight: FontWeight.w600),
        displayMedium: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeTwenty, fontWeight: FontWeight.w600),
        displaySmall: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeEighteen,
            fontWeight: FontWeight.w600),
        headlineLarge: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeTwentyFour,
            fontWeight: FontWeight.w500),
        headlineMedium: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeTwenty, fontWeight: FontWeight.w500),
        headlineSmall: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeEighteen,
            fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeEighteen,
            fontWeight: FontWeight.w500),
        titleMedium: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeSixteen, fontWeight: FontWeight.w500),
        titleSmall: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeFourteen,
            fontWeight: FontWeight.w500),
        labelLarge: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeTwenty, fontWeight: FontWeight.w400),
        bodyLarge: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeTwenty, fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeEighteen,
            fontWeight: FontWeight.w500),
        bodySmall: GoogleFonts.tajawal(
            fontSize: AppConstant.fontSizeSixteen, fontWeight: FontWeight.w400),
      ),
      // buttonTheme: ButtonThemeData(
      //   minWidth: AppConstant.appWidthThemeTwo,
      //   height: 60.h,
      //   shape: RoundedRectangleBorder(
      //     borderRadius:
      //         BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //     side: BorderSide(
      //       width: AppConstant.appWidthThemeOne,
      //       color: AppColors.secondaryColor,
      //     ),
      //   ),
      // ),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //   shape: CircleBorder(
      //     side: BorderSide(
      //       width: AppConstant.appWidthThemeOne,
      //     ),
      //   ),
      //   iconSize: 20,
      //   mouseCursor: MaterialStateMouseCursor.clickable,
      // ),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: MaterialStatePropertyAll(
      //       Theme.of(context).textTheme.headlineSmall,
      //     ),
      //     shape: MaterialStatePropertyAll(
      //       RoundedRectangleBorder(
      //         borderRadius:
      //             BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //         side: BorderSide(
      //           width: AppConstant.appWidthThemeOne,
      //           color: AppColors.secondaryColor,
      //         ),
      //       ),
      //     ),
      //     mouseCursor: const MaterialStatePropertyAll(
      //       MaterialStateMouseCursor.clickable,
      //     ),
      //     animationDuration: const Duration(seconds: 2),
      //   ),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: MaterialStatePropertyAll(
      //       Theme.of(context).textTheme.headlineSmall,
      //     ),
      //     shape: MaterialStatePropertyAll(
      //       RoundedRectangleBorder(
      //         borderRadius:
      //             BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //         side: BorderSide(
      //           width: AppConstant.appWidthThemeOne,
      //           color: AppColors.secondaryColor,
      //         ),
      //       ),
      //     ),
      //     mouseCursor: const MaterialStatePropertyAll(
      //       MaterialStateMouseCursor.clickable,
      //     ),
      //     animationDuration: const Duration(seconds: 2),
      //   ),
      // ),
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: MaterialStatePropertyAll(
      //       Theme.of(context).textTheme.headlineSmall,
      //     ),
      //     shape: MaterialStatePropertyAll(
      //       RoundedRectangleBorder(
      //         borderRadius:
      //             BorderRadius.all(Radius.circular(AppConstant.appRadius)),
      //         side: BorderSide(
      //           width: AppConstant.appWidthThemeOne,
      //           color: AppColors.secondaryColor,
      //         ),
      //       ),
      //     ),
      //     mouseCursor: const MaterialStatePropertyAll(
      //       MaterialStateMouseCursor.clickable,
      //     ),
      //     animationDuration: const Duration(seconds: 2),
      //   ),
      // ),
    );
  }
}
