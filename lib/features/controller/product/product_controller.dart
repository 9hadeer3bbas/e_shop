import 'package:flutter/material.dart';

import '../../../core/class/status_requests/status_requests.dart';
import '../../../core/constant/colors/colors.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes/routes.dart';
import '../../../core/functions/handling_data/handling_data.dart';
import '../../../core/functions/show_snack_bar_message/show_snack_bar_message.dart';
import '../../../core/services/services.dart';
import '../../data/data_source/remote/products/products_within_category_data.dart';
import '../../data/data_source/remote/products/search_product_data.dart';
import '../../data/models/product/product_model.dart';

abstract class ProductController extends GetxController {
  void plusNum();
  void minusNum();
  void changeColor1(bool currentBtn);
  void changeColor2(bool currentBtn);
  void changeColor3(bool currentBtn);
  getProductsWithinCategory({
    required String categoryId,
  });
  searchProduct({
    required String name,
  });
}

class ProductControllerImpl extends ProductController {
  int counter = 1;
  bool btn1 = true;
  bool btn2 = false;
  bool btn3 = false;
  Color focusColor = AppColors.grey5Color;

  final TextEditingController searchController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ProductsWithinCategoryData productsWithinCategoryData =
      ProductsWithinCategoryData(crudRequests: Get.find());
  List<Product> productsWithinCategory = [];
  SearchProductData searchProductData =
      SearchProductData(crudRequests: Get.find());
  List<Product> searchProducts = [];
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

  @override
  void changeColor1(bool currentBtn) {
    btn1 = currentBtn;
    update();
  }

  @override
  void changeColor2(bool currentBtn) {
    btn2 = currentBtn;
    update();
  }

  @override
  void changeColor3(bool currentBtn) {
    btn3 = currentBtn;
    update();
  }

  @override
  getProductsWithinCategory({
    required String categoryId,
  }) async {
    statusRequest = StatusRequest.loading;
    productsWithinCategory.clear();
    update();
    var response = await productsWithinCategoryData
        .getProductsWithinCategoryData(categoryId: categoryId) as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['all products'] != null) {
        response['all products']
            .map((product) =>
                productsWithinCategory.add(Product.fromJson(product)))
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
  searchProduct({
    required String name,
  }) async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      searchProducts.clear();
      update();
      var response =
          await searchProductData.getSearchProductData(name: name) as Map;
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['products'] != null) {
          response['products']
              .map((product) => searchProducts.add(Product.fromJson(product)))
              .toList();

          update();
          Get.toNamed(AppRoutes.results);
        }
      } else {
        showSnackBarMessage(title: "Warning!", message: "There's a mistake.");
        statusRequest = handlingData(response);
        update();
      }
    } else {
      showSnackBarMessage(
          title: "Warning!", message: "You must to fill the field.");
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
