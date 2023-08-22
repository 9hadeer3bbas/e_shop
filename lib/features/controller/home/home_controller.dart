import 'package:get/get.dart';

import '../../../core/class/status_requests/status_requests.dart';
import '../../../core/functions/handling_data/handling_data.dart';
import '../../../core/functions/show_snack_bar_message/show_snack_bar_message.dart';
import '../../../core/services/services.dart';
import '../../data/data_source/remote/categories/category_data.dart';
import '../../data/data_source/remote/products/most_papular_product_data.dart';
import '../../data/data_source/remote/products/most_sale_product_data.dart';
import '../../data/models/categories/category_model.dart';
import '../../data/models/product/product_model.dart';

abstract class HomeScreenController extends GetxController {
  getCategories();
  getMostSalesProducts();
  getMostPapularProducts();
}

class HomeScreenControllerImpl extends HomeScreenController {
  StatusRequest? statusRequest;
  CategoryData categoryData = CategoryData(crudRequests: Get.find());
  List<Category> categories = [];
  MostSaleProductData mostSaleProductData =
      MostSaleProductData(crudRequests: Get.find());
  List<Product> mostSalesProducts = [];
  MostPapularProductData mostPapularProductData =
      MostPapularProductData(crudRequests: Get.find());
  List<Product> mostPapularProducts = [];
  final MyServices myServices = Get.find();

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryData.getCategoriesData() as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['All Category'] != null) {
        response['All Category']
            .map((category) => categories.add(Category.fromJson(category)))
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
  getMostSalesProducts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await mostSaleProductData.getMostSaleProductData() as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['all Product'] != null) {
        response['all Product']
            .map((product) => mostSalesProducts.add(Product.fromJson(product)))
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
  getMostPapularProducts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await mostPapularProductData.getMostPapularProductData() as Map;
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['all Product'] != null) {
        response['all Product']
            .map((product) => mostPapularProducts.add(Product.fromJson(product)))
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
  void onInit() {
    getCategories();
    getMostSalesProducts();
    getMostPapularProducts();
    super.onInit();
  }
}

