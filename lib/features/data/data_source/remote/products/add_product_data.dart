import 'dart:io';

import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class AddProductData {
  CrudRequests crudRequests;
  AddProductData({
    required this.crudRequests,
  });

  Future<Object> postAddProductFormData({
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
    var response = await crudRequests.postFormData2(
      imageFile: image1,
      imageFile2: image2,
      linkUrl: AppLinksApi.addProduct,
      data: {
        'category_id': categoryId,
        'name': name,
        'old_price': oldPrice,
        'description': description,
        'colors[0]': color1.toString(),
        'colors[1]': color2.toString(),
        'quantities[0]': quantities1.toString(),
        'quantities[1]': quantities2.toString(),
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}

