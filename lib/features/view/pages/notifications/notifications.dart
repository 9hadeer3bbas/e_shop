import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/shared/widgets/widgets_v1.dart';
import 'package:eshop_app/features/controller/notifications/notifications_controller.dart';
import 'package:eshop_app/features/data/data_source/local/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:eshop_app/core/shared/extentions/extentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final NotificationsScreenControllerImpl controller =
      Get.put(NotificationsScreenControllerImpl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsScreenControllerImpl>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 0.0,
            centerTitle: true,
            title: const Text("Notifications"),
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
                  CustomNotifyWidget(
                      title: notifications[0].title,
                      date: notifications[0].date,
                      image: notifications[0].image,
                      subtitle: notifications[0].subtitle),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  CustomNotifyWidget(
                      title: notifications[1].title,
                      date: notifications[1].date,
                      image: notifications[1].image,
                      subtitle: notifications[1].subtitle),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  CustomNotifyWidget(
                      title: notifications[2].title,
                      date: notifications[2].date,
                      image: notifications[2].image,
                      subtitle: notifications[2].subtitle),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  CustomNotifyWidget(
                      title: notifications[3].title,
                      date: notifications[3].date,
                      image: notifications[3].image,
                      subtitle: notifications[3].subtitle),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  CustomNotifyWidget(
                      title: notifications[4].title,
                      date: notifications[4].date,
                      image: notifications[4].image,
                      subtitle: notifications[4].subtitle),
                  SizedBox(
                    height: 10.0.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
