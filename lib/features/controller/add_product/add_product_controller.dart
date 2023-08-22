import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/class/status_requests/status_requests.dart';
import '../../../core/constant/routes/routes.dart';
import '../../../core/functions/handling_data/handling_data.dart';
import '../../../core/functions/show_snack_bar_message/show_snack_bar_message.dart';
import '../../data/data_source/remote/products/add_product_data.dart';

abstract class AddProductScreenController extends GetxController {
  @override
  onClose();
  @override
  onInit();
  pickImage1();
  pickImage2();
  onChangedCategory(categoryValue);
  onChangedQuantities(quantitiesValue);
  createProduct({
    required String categoryId,
    required String name,
    required String oldPrice,
    required String description,
    File? image1,
    File? image2,
    required int color1,
    required int color2,
    required int quantities1,
    required int quantities2,
  });
}

class AddProductScreenControllerImpl extends AddProductScreenController {
  final TextEditingController productCategoryIdController =
      TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDiscriptionController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  AddProductData addProductData = AddProductData(crudRequests: Get.find());
  StatusRequest? statusRequest;

  double price = 10000;
  File? image1Temporary;
  File? image2Temporary;
  bool btn1 = true;
  bool btn2 = false;
  bool btn3 = false;

  List<String> listofCategory = <String>[];
  static List<String> listofQuantities = <String>[
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
  ];

  late String dropdownCategoryValue;
  String dropdownQuantitiesValue = listofQuantities.first;

  @override
  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      image1Temporary = File(image.path);
      update();
    } on PlatformException catch (error) {
      showSnackBarMessage(
          title: "Warning!",
          message:
              "Failed to Pick Image we need permission to access phone files ! : $error");
    }
  }

  @override
  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      image2Temporary = File(image.path);
      update();
    } on PlatformException catch (error) {
      showSnackBarMessage(
          title: "Warning!",
          message:
              "Failed to Pick Image we need permission to access phone files ! : $error");
    }
  }

  @override
  onChangedCategory(categoryValue) {
    dropdownCategoryValue = categoryValue!;
    update();
  }

  @override
  onChangedQuantities(quantitiesValue) {
    dropdownQuantitiesValue = quantitiesValue!;
    update();
  }

  @override
  void onClose() {}

  void changeColor1() {
    if (btn1) {
      btn1 = false;
    } else {
      btn1 = true;
    }
    update();
  }

  void changeColor2() {
    if (btn2) {
      btn2 = false;
    } else {
      btn2 = true;
    }
    update();
  }

  void changeColor3() {
    if (btn3) {
      btn3 = false;
    } else {
      btn3 = true;
    }
    update();
  }

  @override
  createProduct({
    required String categoryId,
    required String name,
    required String oldPrice,
    required String description,
    File? image1,
    File? image2,
    required int color1,
    required int color2,
    required int quantities1,
    required int quantities2,
  }) async {
    if (formKey1.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addProductData.postAddProductFormData(
        categoryId: categoryId,
        name: name,
        oldPrice: oldPrice,
        description: description,
        color1: color1,
        color2: color2,
        quantities1: quantities1,
        quantities2: quantities2,
        image1: image1,
        image2: image2,
      );
      statusRequest = handlingData(response);
      log(statusRequest.toString());
      if (statusRequest == StatusRequest.success) {
        showSnackBarMessage(
            title: "Success", message: "it has been added successfully.");
        Get.offNamed(AppRoutes.layout);
      } else {
        showSnackBarMessage(
            title: "Warning!",
            message: "There is a wrong in adding process, try again late!");
      }
    } else {
      showSnackBarMessage(title: "you must enter all fields");
    }
  }

  @override
  void dispose() {
    productCategoryIdController.dispose();
    productDiscriptionController.dispose();
    productNameController.dispose();
    productPriceController.dispose();
    super.dispose();
  }
}
