import 'dart:developer';
import 'dart:io';

import '../../../core/class/status_requests/status_requests.dart';
import '../../../core/constant/colors/colors.dart';
import '../../../core/constant/routes/routes.dart';
import '../../../core/functions/handling_data/handling_data.dart';
import '../../../core/functions/show_snack_bar_message/show_snack_bar_message.dart';
import '../../../core/services/services.dart';
import '../../data/data_source/remote/auth/forget_password_data.dart';
import '../../data/data_source/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/data_source/remote/auth/reset_password_data.dart';
import '../../data/data_source/remote/auth/sign_up_company_confirm_code_data.dart';
import '../../data/data_source/remote/auth/sign_up_data.dart';
import '../../data/models/users/user_company_account.dart';

abstract class AuthController extends GetxController {
  pickImage();
  showPassword();
  changeColor();
  changeConfirmColor();
  showConfirmPassword();
  onChangedGender(value);
  @override
  onClose();
  chooseDate(value);
  disableDate(DateTime day);
  login({
    required String email,
    required String password,
  });
  signUpUser({
    required String type,
    String? gender,
    String? birthday,
    File? image,
  });
  signUpCompany({
    required String type,
    required String owner,
    required String isConfirmed,
  });
  companyConfirmCode({
    required String companyName,
    required String code,
  });
  forgetPassword({
    required String email,
  });
  resetPassword({
    required String code,
    required String password,
    required String passwordConfirm,
  });
}

class AuthControllerImpl extends AuthController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController codeNumberController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController registrationNoController =
      TextEditingController();

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey5 = GlobalKey<FormState>();

  late UserCompanyAccount userCompanyAccount;
  LoginData loginData = LoginData(crudRequests: Get.find());
  SignUpData signUpData = SignUpData(crudRequests: Get.find());
  SignUpCompanyConfirmCodeData signUpCompanyConfirmCodeData =
      SignUpCompanyConfirmCodeData(crudRequests: Get.find());
  ForgetPasswordData forgetPasswordData =
      ForgetPasswordData(crudRequests: Get.find());
  ResetPasswordData resetPasswordData =
      ResetPasswordData(crudRequests: Get.find());
  StatusRequest? statusRequest;

  MyServices myServices = Get.find();

  File? image;
  File? imageTemporary;
  bool isShowPassword = true;
  bool isShowConfirmNewPassword = true;
  Color suffixColorIcon = Colors.grey;
  Color suffixConfirmColorIcon = Colors.grey;
  static List<String> list = <String>['male'.tr, 'female'.tr];
  var selectedDate = DateTime(2000, 01, 01);

  String dropdownValue = list.first;
  @override
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imageTemporary = File(image.path);
      update();
    } on PlatformException catch (error) {
      showSnackBarMessage(
          title: "Warning!",
          message:
              "Failed to Pick Image we need permission to access phone files ! : $error");
    }
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  onChangedGender(value) {
    dropdownValue = value!;
    update();
  }

  @override
  changeColor() {
    isShowPassword
        ? suffixColorIcon = AppColors.greyColor
        : suffixColorIcon = AppColors.primaryColor;
    update();
  }

  @override
  showConfirmPassword() {
    isShowConfirmNewPassword = isShowConfirmNewPassword == true ? false : true;
    update();
  }

  @override
  changeConfirmColor() {
    isShowConfirmNewPassword
        ? suffixConfirmColorIcon = AppColors.greyColor
        : suffixConfirmColorIcon = AppColors.primaryColor;
    update();
  }

  @override
  void onClose() {}

  @override
  void onInit() {
    userCompanyAccount = UserCompanyAccount();
    super.onInit();
  }

  @override
  chooseDate(value) async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimary: AppColors.whiteColor,
                    onSurface: AppColors.blackColor.withOpacity(0.8)),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.blackColor))),
            child: child!);
      },
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2005),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Choose your date of birth',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
    }
    update();
  }

  @override
  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  @override
  login({
    required String email,
    required String password,
  }) async {
    if (formKey1.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postData(email: email, password: password) as Map;
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['message'] == "Invalid Credentials") {
          showSnackBarMessage(
              title: "Warning!",
              message: "There's a mistake in one of the fields.");
          statusRequest = handlingData(response);
          update();
        }
        myServices.sharedPreferences
            .setString("token", response["access_token"]);
        myServices.sharedPreferences.setInt("user_id", response["user"]["id"]);
        myServices.sharedPreferences
            .setString("type", response["user"]["type"]);
        myServices.sharedPreferences
            .setString("email", response["user"]["email"]);
        myServices.sharedPreferences
            .setString("first_name", response["user"]["first_name"]);
        myServices.sharedPreferences
            .setString("last_name", response["user"]["last_name"]);
        log(myServices.sharedPreferences.getString("token")!);
        myServices.sharedPreferences.setBool("logging", true);
        Get.offNamed(AppRoutes.layout);
      } else {
        showSnackBarMessage(
            title: "Wrong!", message: "There is a wrong, try again late");
      }
    } else {
      showSnackBarMessage(
          title: "Wrong!", message: "you must enter all fields");
    }
  }

  @override
  signUpUser({
    required String type,
    String? gender,
    String? birthday,
    File? image,
  }) async {
    if (formKey3.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postUserFormData(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailAddressController.text,
        password: passwordController.text,
        type: type,
        gender: gender,
        birthday: birthday,
        image: image,
      ) as Map;
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['success'] == false) {
          for (var element in response['message']) {
            if (element == "The email has already been taken.") {
              statusRequest = handlingData(response);
              update();
              showSnackBarMessage(title: "Warning!", message: "$element");
            } else if (element ==
                "The password must be at least 8 characters.") {
              statusRequest = handlingData(response);
              update();
              showSnackBarMessage(title: "Warning!", message: "$element");
            }
          }
        } else {
          Get.offNamed(AppRoutes.registerationSuccess);
        }
      } else {
        showSnackBarMessage(
            title: "Warning!",
            message: "There is a wrong in sign up process, try again late");
      }
    } else {
      showSnackBarMessage(
          title: "Wrong!", message: "you must enter all fields");
    }
  }

  @override
  signUpCompany({
    required String type,
    required String owner,
    required String isConfirmed,
  }) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postCompanyFormData(
      firstName: firstNameController.text,
      email: emailAddressController.text,
      password: passwordController.text,
      type: type,
      owner: owner,
      isConfirmed: isConfirmed,
    ) as Map;

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['success'] == false) {
        for (var element in response['message']) {
          if (element == "The email has already been taken.") {
            statusRequest = handlingData(response);
            update();
            showSnackBarMessage(title: "Warning!", message: "$element");
          } else if (element == "The password must be at least 8 characters.") {
            statusRequest = handlingData(response);
            update();
            showSnackBarMessage(title: "Warning!", message: "$element");
          }
        }
      } else {
        Get.offNamed(AppRoutes.registerationSuccess);
      }
    } else {
      showSnackBarMessage(
          title: "Warning!",
          message: "There is a wrong in sign up process, try again late");
    }
  }

  @override
  companyConfirmCode({
    required String companyName,
    required String code,
  }) async {
    if (formKey3.currentState!.validate()) {
      update();
      var response = await signUpCompanyConfirmCodeData.postConfirmCode(
          compamyName: companyName, code: code);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response == 1) {
          statusRequest = handlingData(response);
          update();
          showSnackBarMessage(message: "cofirmed code".tr);
        } else {
          showSnackBarMessage(message: "uncofirmed code".tr);
        }
        myServices.sharedPreferences
            .setString("is_confirmed", response == 1 ? "1" : "0");
      } else {
        showSnackBarMessage(message: "uncofirmed code".tr);
      }
    } else {
      showSnackBarMessage(message: "you must enter all fields".tr);
    }
  }

  @override
  forgetPassword({
    required String email,
  }) async {
    if (formKey4.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await forgetPasswordData.postForgetPasswordData(email: email) as Map;
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['message'] == "code.sent") {
          showSnackBarMessage(
              title: "Success", message: "${response['message']}");
          statusRequest = handlingData(response);
          update();
          Get.offNamed(AppRoutes.resetPassword);
        } else if (response['message'] == "The selected email is invalid.") {
          showSnackBarMessage(
              title: "Warning!", message: "${response['message']}");
          statusRequest = handlingData(response);
          update();
        } else {
          showSnackBarMessage(
              title: "Warning!", message: "There is a wrong, try again late");
          statusRequest = handlingData(response);
          Get.offNamed(AppRoutes.resetPassword);

          update();
        }
      } else {
        statusRequest = handlingData(response);
        update();
        showSnackBarMessage(
            title: "Wrong!", message: "There is a wrong, try again late.");
      }
    } else {
      showSnackBarMessage(message: "you must enter all fields".tr);
    }
  }

  @override
  resetPassword({
    required String code,
    required String password,
    required String passwordConfirm,
  }) async {
    if (formKey5.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postResetPasswordData(
        code: code,
        password: password,
        passwordConfirm: passwordConfirm,
      ) as Map;
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['message'] == "password has been successfully reset") {
          showSnackBarMessage(
              title: "Success", message: "${response['message']}");
          statusRequest = handlingData(response);
          update();
          Get.offAllNamed(AppRoutes.signIn);
        } else if (response['message'] == "The selected code is invalid.") {
          showSnackBarMessage(
              title: "Warning!", message: "${response['message']}");
          statusRequest = handlingData(response);
          update();
        } else if (response['message'] ==
            "The password confirmation does not match.") {
          showSnackBarMessage(
              title: "Warning!", message: "${response['message']}");
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
    } else {
      showSnackBarMessage(message: "you must enter all fields".tr);
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    ownerNameController.dispose();
    registrationNoController.dispose();
    passwordConfirmController.dispose();
    codeNumberController.dispose();
    super.dispose();
  }
}
