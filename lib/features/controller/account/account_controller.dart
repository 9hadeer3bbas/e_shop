import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_requests/status_requests.dart';
import '../../../core/constant/colors/colors.dart';
import '../../../core/constant/routes/routes.dart';
import '../../../core/functions/handling_data/handling_data.dart';
import '../../../core/functions/show_snack_bar_message/show_snack_bar_message.dart';
import '../../data/data_source/remote/auth/change_password_data.dart';
import '../../data/data_source/remote/auth/logout_data.dart';
import '../../data/data_source/remote/my_profile/my_profile_data.dart';
import '../../data/models/users/profile_model.dart';

abstract class AccountScreenController extends GetxController {
  showCurrentPassword();
  changeCurrentColor();
  showNewPassword();
  changeNewColor();
  showNewConfirmPassword();
  changeNewConfirmColor();
  logOut();
  getProfileInfo();
  changePassword({
    required String currentPassword,
    required String newPassword,
    required String newConfirmPassword,
  });
}

class AccountScreenControllerImpl extends AccountScreenController {
  final TextEditingController currentpasswordController =
      TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController newpasswordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  bool isShowCurrentPassword = true;
  Color suffixColorCurrentIcon = Colors.grey;
  bool isShowNewPassword = true;
  Color suffixColorNewIcon = Colors.grey;
  bool isShowNewConfirmPassword = true;
  Color suffixColorNewConfirmIcon = Colors.grey;

  LogOutData logOutData = LogOutData(crudRequests: Get.find());
  MyProfileData myProfileData = MyProfileData(crudRequests: Get.find());
  ChangePasswordData changePasswordData =
      ChangePasswordData(crudRequests: Get.find());
  List<Profile> myProfile = [];
  StatusRequest? statusRequest;

  @override
  showCurrentPassword() {
    isShowCurrentPassword = isShowCurrentPassword == true ? false : true;
    update();
  }

  @override
  changeCurrentColor() {
    isShowCurrentPassword
        ? suffixColorCurrentIcon = AppColors.greyColor
        : suffixColorCurrentIcon = AppColors.primaryColor;
    update();
  }

  @override
  showNewPassword() {
    isShowNewPassword = isShowNewPassword == true ? false : true;
    update();
  }

  @override
  changeNewColor() {
    isShowNewPassword
        ? suffixColorNewIcon = AppColors.greyColor
        : suffixColorNewIcon = AppColors.primaryColor;
    update();
  }

  @override
  showNewConfirmPassword() {
    isShowNewConfirmPassword = isShowNewConfirmPassword == true ? false : true;
    update();
  }

  @override
  changeNewConfirmColor() {
    isShowNewConfirmPassword
        ? suffixColorNewConfirmIcon = AppColors.greyColor
        : suffixColorNewConfirmIcon = AppColors.primaryColor;
    update();
  }

  @override
  logOut() async {
    
    statusRequest = StatusRequest.loading;
    update();
    var response = await logOutData.logOutData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      showSnackBarMessage(
          title: "Success", message: "User logged out successfully");
      statusRequest = handlingData(response);
      
      update();
      Get.offNamed(AppRoutes.signIn);
    } else {
      statusRequest = handlingData(response);
      update();
      showSnackBarMessage(
          title: "Wrong!", message: "There is a wrong, try again late.");
    }
  }

  @override
  getProfileInfo() async {
    statusRequest = StatusRequest.loading;
    myProfile.clear();
    update();
    var response = await myProfileData.getMyProfileData() as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      myProfile = [];
      if (response['data'] != null) {
        response['data']
            .map((profile) => myProfile.add(Profile.fromJson(profile)))
            .toList();

        update();
      }
    } else {
      showSnackBarMessage(title: "Warning!", message: "There's a mistake.");
      statusRequest = handlingData(response);
      update();
    }
  }

  @override
  changePassword({
    required String currentPassword,
    required String newPassword,
    required String newConfirmPassword,
  }) async {
    if(formKey1.currentState!.validate()){
      statusRequest = StatusRequest.loading;
    update();
    var response = await changePasswordData.postChangePasswordData(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newConfirmPassword: newConfirmPassword,
    ) as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['message'] == "Password changed successfully") {
        showSnackBarMessage(
            title: "Success", message: "${response['message']}");
        statusRequest = handlingData(response);
        update();
      } else if (response['message'] ==
          "The new password confirmation does not match.") {
        showSnackBarMessage(
            title: "Warning!", message: "${response['message']}");
        statusRequest = handlingData(response);
        update();
      } else if (response['error'] == "Current password is incorrect") {
        showSnackBarMessage(title: "Warning!", message: "${response['error']}");
        statusRequest = handlingData(response);
        update();
      } else {
        showSnackBarMessage(
            title: "Warning!", message: "There is a wrong, try again late");
        statusRequest = handlingData(response);
        update();
      }
    } else {
      statusRequest = handlingData(response);
      update();
      showSnackBarMessage(
          title: "Wrong!", message: "There is a wrong, try again late.");
    }
    }else{
      showSnackBarMessage(
          title: "Wrong!", message: "You must to fill all the fields");
    }
  }

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }

  @override
  void dispose() {
    currentpasswordController.dispose();
    newpasswordController.dispose();
    newpasswordConfirmationController.dispose();
    super.dispose();
  }
}
