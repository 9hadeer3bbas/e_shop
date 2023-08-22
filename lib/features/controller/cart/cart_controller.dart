import 'dart:developer';

import 'package:eshop_app/core/constant/colors/colors.dart';
import 'package:eshop_app/core/constant/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_requests/status_requests.dart';
import '../../../core/functions/handling_data/handling_data.dart';
import '../../../core/functions/show_snack_bar_message/show_snack_bar_message.dart';
import '../../../core/services/services.dart';
import '../../data/data_source/remote/products/check_out_product_data.dart';
import '../../data/data_source/remote/regions/regions_data.dart';
import '../../data/models/product/product_model.dart';
import '../../data/models/regions/region_model.dart';

abstract class CartScreenController extends GetxController {
  void plusNum();
  void minusNum();
  void addProduct(Product product);
  void removeProduct(Product product);
  bool noOrder();
  getRegions();
  onChangedRegion(regionValue);
  checkOutProduct({
    required String regionId,
    required String details,
    required String total,
  });
}

class CartScreenControllerImpl extends CartScreenController {
  Color focusColor = AppColors.grey5Color;
  bool isNoOrder = true;
  int counter = 1;
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController detailsController = TextEditingController();

  RegionsData regionsData = RegionsData(crudRequests: Get.find());
  CheckOutProductData checkOutProductData =
      CheckOutProductData(crudRequests: Get.find());
  List<RegionModel> regions = [];

  List<String> regionsList = [];
  late String dropdownRegionValue;
  final MyServices myServices = Get.find();
  StatusRequest? statusRequest;

  @override
  void plusNum() {
    if (counter < 10) {
      counter++;
    }
    if (counter > 1) {
      focusColor = AppColors.grey3Color;
    }
    update();
  }

  @override
  void minusNum() {
    if (counter > 1) {
      counter--;
    } else {
      return;
    }
    if (counter == 1) {
      focusColor = AppColors.grey5Color;
    }
    update();
  }

  final _product = {};

  @override
  void addProduct(Product product) {
    if (_product.containsKey(product)) {
      _product[product] += 1;
      noOrder();
      update();
    } else {
      _product[product] = 1;
      noOrder();
      update();
    }
    Get.snackbar(
      "Prodcut Added",
      "You have added the ${product.name} to the cart",
      margin: const EdgeInsets.all(15.0),
      snackPosition: SnackPosition.TOP,
      duration: 2.seconds,
    );
  }

  get products => _product;

  @override
  void removeProduct(Product product) {
    if (_product.containsKey(product) && _product[product] == 1) {
      _product.removeWhere((key, value) => key == product);
      noOrder();
      update();
      Get.snackbar(
        "Prodcut Added",
        "You have remove the ${product.name} from the cart",
        margin: const EdgeInsets.all(15.0),
        snackPosition: SnackPosition.TOP,
        duration: 2.seconds,
      );
    } else {
      if (_product[product] == 1) {
        _product[product] -= 1;
        noOrder();
        update();
      } else {
        _product[product] -= 1;
        noOrder();
        update();
      }
    }
  }

  get productSubtotal => _product.entries
      .map((product) => product.key.newPrice * product.value)
      .toList();

  get total => _product.entries
      .map((product) => product.key.newPrice * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  @override
  bool noOrder() {
    if (_product.isEmpty) {
      isNoOrder = true;
      update();
      log(isNoOrder.toString());
      return isNoOrder;
    } else {
      isNoOrder = false;
      update();
      log(isNoOrder.toString());
      return isNoOrder;
    }
  }

  @override
  onChangedRegion(regionValue) {
    dropdownRegionValue = regionValue!;
    update();
  }

  @override
  getRegions() async {
    statusRequest = StatusRequest.loading;
    regions.clear();
    update();
    var response = await regionsData.getRegionsData() as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['All Region'] != null) {
        response['All Region']
            .map((region) => regions.add(RegionModel.fromJson(region)))
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
  checkOutProduct({
    required String regionId,
    required String details,
    required String total,
  }) async {
    if (formKey1.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await checkOutProductData.checkOutProductData(
        regionId: regionId,
        details: details,
        total: total,
      );
      statusRequest = handlingData(response);
      log(statusRequest.toString());
      if (statusRequest == StatusRequest.success) {
        products.clear();
        noOrder();
        update();
        showSnackBarMessage(
          title: "Success",
          message: "it has been checkouted successfully.",
        );

        Get.offNamed(AppRoutes.paymentSuccess);
      } else {
        showSnackBarMessage(
            title: "Wrong!", message: "There is a wrong, try again late");
      }
    } else {
      showSnackBarMessage(
          title: "Wrong!", message: "There is a wrong, try again late..");
    }
  }

  @override
  void onInit() {
    getRegions();
    super.onInit();
  }

  @override
  void dispose() {
    detailsController.dispose();
    super.dispose();
  }
}
