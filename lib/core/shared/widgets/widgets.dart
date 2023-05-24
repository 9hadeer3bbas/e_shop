// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/data/models/home/item_card_home.dart';
import '../../constant/app_assets/app_assets.dart';
import '../../constant/colors/colors.dart';
import '../../constant/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? iconData;
  final Color? iconDataColor;
  final TextEditingController textEditingController;
  final String? Function(String?) validation;
  final void Function()? onTapSuffix;
  final bool? obscureText;
  final TextInputType keyBoardType;
  final TextDirection? textDirection;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.iconDataColor,
    this.iconData,
    required this.textEditingController,
    required this.validation,
    this.obscureText,
    this.onTapSuffix,
    required this.keyBoardType,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFFF0F3F8),
          borderRadius: BorderRadius.circular(12.0)),
      width: 380,
      height: 70,
      child: TextFormField(
        controller: textEditingController,
        validator: validation,
        style: const TextStyle(fontSize: 20.0, color: Color(0xFF828B9A)),
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyBoardType,
        focusNode: FocusNode(),
        textInputAction: TextInputAction.send,
        textDirection: textDirection,
        mouseCursor: MaterialStateMouseCursor.clickable,
        showCursor: true,
        cursorColor: AppColors.lightGrayThreeColor,
        cursorRadius: Radius.circular(AppConstant.appRadius),
        scrollPhysics: const BouncingScrollPhysics(),
        decoration: InputDecoration(
          fillColor: AppColors.grayColor.withOpacity(0.5),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(15.0),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.grayColor, fontSize: 20.0),
          suffixIcon: SizedBox(
            height: 15.h,
            width: 17.25.w,
            child: InkWell(
              onTap: onTapSuffix,
              child: SvgPicture.asset(
                iconData!,
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(iconDataColor!, BlendMode.srcIn),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: const Color(0xFFF0F3F8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: const Color(0xFFF0F3F8),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: AppColors.redColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.appRadius),
            borderSide: BorderSide(
              width: AppConstant.appWidthThemeOne,
              color: AppColors.lightGrayThreeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final Widget childWidget;
  final void Function() onTapButton;
  final Color colorButton;
  final Color? highlightColorButton;
  final Color? splashColorButton;
  final Color? hoverColorButton;
  final Color? focusColorButton;
  final double heightButton;
  final double widthButton;
  const CustomButton({
    super.key,
    required this.childWidget,
    required this.onTapButton,
    required this.colorButton,
    this.highlightColorButton,
    this.splashColorButton,
    this.hoverColorButton,
    this.focusColorButton,
    required this.heightButton,
    required this.widthButton,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(AppConstant.appRadius),
      ),
      highlightColor: widget.highlightColorButton,
      splashColor: widget.splashColorButton,
      hoverColor: widget.hoverColorButton,
      focusColor: widget.focusColorButton,
      splashFactory: InkSplash.splashFactory,
      radius: 11.r,
      focusNode: FocusNode(),
      onHighlightChanged: (value) {
        setState(
          () {},
        );
      },
      onTap: widget.onTapButton,
      child: AnimatedContainer(
        duration: 1000.milliseconds,
        curve: Curves.fastLinearToSlowEaseIn,
        height: 70.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: widget.colorButton,
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstant.appRadius),
          ),
        ),
        child: widget.childWidget,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String textData;
  final TextOverflow? overFlowText;
  final TextAlign? textAlignText;
  final int? maxLineTextSpan;
  final TextStyle textStyles;
  final StrutStyle? strutStyles;
  const CustomText({
    super.key,
    required this.textData,
    this.overFlowText,
    this.textAlignText,
    this.maxLineTextSpan,
    required this.textStyles,
    this.strutStyles,
    required TextDirection textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      overflow: overFlowText,
      textAlign: textAlignText,
      textDirection: TextDirection.rtl,
      maxLines: maxLineTextSpan,
      style: textStyles,
      strutStyle: strutStyles,
    );
  }
}

class CustomFloatingActionButtonOne extends StatelessWidget {
  final String imageButton;
  final void Function() onPressedButton;
  const CustomFloatingActionButtonOne({
    super.key,
    required this.onPressedButton,
    required this.imageButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              imageButton,
            ),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonTwo extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressedButton;
  final Color? colorButton;
  final Color iconColor;
  final List<Color>? colorsButton;
  const CustomFloatingActionButtonTwo({
    super.key,
    required this.onPressedButton,
    required this.iconData,
    this.colorButton,
    this.colorsButton,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorButton,
          gradient: LinearGradient(
            colors: colorsButton ?? [],
          ),
        ),
        child: Icon(
          iconData,
          size: 15,
          color: iconColor,
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonThree extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressedButton;

  final Color iconColor;
  final List<Color> colorsButton;
  const CustomFloatingActionButtonThree({
    super.key,
    required this.onPressedButton,
    required this.iconData,
    required this.colorsButton,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colorsButton,
          ),
        ),
        child: Icon(
          iconData,
          size: 15,
          color: iconColor,
        ),
      ),
    );
  }
}

// class BottomNavBar extends StatelessWidget {
//   BottomNavBar({super.key});

//   final BottomNavBarControllerImpl controller =
//       Get.put(BottomNavBarControllerImpl());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BottomNavBarControllerImpl>(
//       builder: (_) {
//         return Container(
//           margin: EdgeInsets.all(context.screenWidth * .04),
//           height: context.screenHeight * .08,
//           decoration: BoxDecoration(
//             color: AppColors.lightGrayThreeColor,
//             borderRadius: BorderRadius.circular(AppConstant.appRadius),
//           ),
//           child: ListView.builder(
//             itemCount: 4,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) => InkWell(
//               onTap: () {
//                 controller.changeCurrentIndex(index);
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: AnimatedContainer(
//                 duration: 1.seconds,
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 width: context.screenWidth * .23.w,
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(
//                       AppConstant.listOfIcons[index],
//                       width: index == controller.currentIndex ? 35.0.w : 30.0.w,
//                       colorFilter: index == controller.currentIndex
//                           ? ColorFilter.mode(
//                               AppColors.primaryColor,
//                               BlendMode.srcIn,
//                             )
//                           : ColorFilter.mode(
//                               AppColors.primaryColor.withOpacity(0.4),
//                               BlendMode.srcIn,
//                             ),
//                     ),
//                     AnimatedOpacity(
//                       opacity: index == controller.currentIndex ? 1 : 0,
//                       duration: 1.seconds,
//                       curve: Curves.fastLinearToSlowEaseIn,
//                       child: Text(
//                         index == controller.currentIndex
//                             ? AppConstant.listOfStrings[index]
//                             : '',
//                         textAlign: TextAlign.center,
//                         style: ThemeHelper(context)
//                             .textTheme
//                             .titleLarge
//                             ?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.blackColor,
//                                 fontSize: 16.0.sp),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class CustomProfilesListView extends StatelessWidget {
//   CustomProfilesListView({super.key});

//   final ListViewProfilesControllerImpl controller =
//       Get.put(ListViewProfilesControllerImpl());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ListViewProfilesControllerImpl>(
//       builder: (_) {
//         return SizedBox(
//           height: 200.0.h,
//           width: 400.0.w,
//           child: ListView.separated(
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             padding: const EdgeInsets.all(10.0),
//             itemBuilder: (context, index) {
//               return buildProfilesCard(index);
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 width: 12.0.w,
//               );
//             },
//             itemCount: 4,
//             scrollDirection: Axis.horizontal,
//           ),
//         );
//       },
//     );
//   }

//   Widget buildProfilesCard(int index) {
//     return Container(
//         decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: AppColors.listViewBackgroundColor,
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//             border: Border.all(
//                 color: AppColors.primaryColor.withOpacity(0.5), width: 0.5),
//             borderRadius: BorderRadius.circular(20.0)),
//         width: 350.w,
//         height: 200.h,
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(12.0),
//                             image: const DecorationImage(
//                               fit: BoxFit.fill,
//                               image: AssetImage(AppAssets.person2),
//                             )),
//                         width: AppConstant.screenWidth * .11,
//                         height: AppConstant.screenHeight * .05,
//                       ),
//                       const SizedBox(width: 10.0),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "ياسر محمد أحمد",
//                             style: TextStyle(
//                                 fontSize: 25.0,
//                                 color: AppColors.whiteColor.withOpacity(0.8)),
//                           ),
//                           Text(
//                             "yasser@gmail.com",
//                             style: TextStyle(
//                                 fontSize: 15.0,
//                                 color: AppColors.whiteColor.withOpacity(0.8)),
//                           )
//                         ],
//                       ),
//                       const Spacer(),
//                       Container(
//                         height: 50.0,
//                         width: 50.0,
//                         decoration: BoxDecoration(
//                             color: AppColors.whiteColor,
//                             borderRadius: BorderRadius.circular(20.0)),
//                         child: IconButton(
//                             onPressed: () {},
//                             icon: SvgPicture.asset(
//                               AppAssets.edit,
//                               colorFilter: ColorFilter.mode(
//                                 AppColors.primaryColor.withOpacity(0.8),
//                                 BlendMode.srcIn,
//                               ),
//                               width: 20.0.w,
//                             )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 35.0.h,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 250.0,
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(AppConstant.appRadius),
//                         border: Border.all(
//                             color: AppColors.whiteColor, width: 1.0)),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "تبديل الحساب",
//                             style: TextStyle(
//                                 color: AppColors.whiteColor,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(width: 30.0),
//                           SvgPicture.asset(
//                             AppAssets.twoarrows,
//                             colorFilter: const ColorFilter.mode(
//                               AppColors.whiteColor,
//                               BlendMode.srcIn,
//                             ),
//                             width: 25.0.w,
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SvgPicture.asset(AppAssets.appicon1,
//                 width: 110.0.w,
//                 colorFilter: const ColorFilter.mode(
//                   AppColors.whiteColor,
//                   BlendMode.srcIn,
//                 )),
//           ],
//         ));
//   }
// }

// class CustomListView extends StatelessWidget {
//   CustomListView({super.key});

//   final ListViewProfilesControllerImpl controller =
//       Get.put(ListViewProfilesControllerImpl());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ListViewProfilesControllerImpl>(
//       builder: (_) {
//         return SizedBox(
//           height: 500.0.h,
//           width: 400.0.w,
//           child: ListView.separated(
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return buildCard(itemsCardHome[index]);
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 height: 50.0.w,
//               );
//             },
//             itemCount: itemsCardHome.length,
//             scrollDirection: Axis.vertical,
//           ),
//         );
//       },
//     );
//   }

//   Widget buildCard(ItemCardHome itemCardHome) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           width: 74.w,
//           height: 74.h,
//           decoration: BoxDecoration(
//               color: AppColors.lightGrayFourColor,
//               borderRadius: BorderRadius.circular(25.0)),
//           child: SvgPicture.asset(
//             itemCardHome.image ?? "",
//             width: 29.55.w,
//             height: 25.h,
//           ),
//         ),
//         const SizedBox(width: 10.0),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               itemCardHome.title ?? "",
//               style:
//                   const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               itemCardHome.subTitle ?? "",
//               style:
//                   const TextStyle(fontSize: 20.0, color: AppColors.grayColor),
//             )
//           ],
//         ),
//         const Spacer(),
//         Container(
//             alignment: Alignment.center,
//             width: 50.0,
//             height: 50.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppConstant.appRadius),
//                 gradient: const LinearGradient(
//                     colors: AppColors.linerLightBlueColor,
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight)),
//             child: Text(
//               itemCardHome.number ?? "",
//               style:
//                   const TextStyle(fontSize: 25.0, color: AppColors.whiteColor),
//             )),
//       ],
//     );
//   }
// }

class HeadText2 extends StatelessWidget {
  final String text;
  const HeadText2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(color: AppColors.primaryColor),
    );
  }
}

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16.0)),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'أهلاً, محمد أحمد',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.account),
            SizedBox(
              width: 16.0.w,
            ),
            Image.asset(AppAssets.account),
          ],
        ),
      ],
    );
  }
}

class AddPhotoComponent extends StatelessWidget {
  final File? image;
  final void Function()? onPressedPickImage;
  late Widget svg = image != null
      ? Image.file(
          image!,
          fit: BoxFit.fill,
          width: 50.0,
          height: 150.0,
        )
      : SvgPicture.asset(
          AppAssets.account,
          fit: BoxFit.none,
        );

  AddPhotoComponent(
      {super.key, required this.image, required this.onPressedPickImage});
  @override
  Widget build(BuildContext context) {
    //IconData ImageSelectIcon = Icons.add;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: AppColors.grayColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: image != null
                  ? Image.file(
                      image!,
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 150.0,
                    )
                  : SvgPicture.asset(
                      AppAssets.account,
                      fit: BoxFit.none,
                    )),
        ),
        Transform.translate(
          offset: Offset(5.0.w, 5.0.h),
          child: CircleAvatar(
            radius: 15.0,
            backgroundColor: AppColors.secondaryColor,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: onPressedPickImage,
              icon: SvgPicture.asset(
                AppAssets.account,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
