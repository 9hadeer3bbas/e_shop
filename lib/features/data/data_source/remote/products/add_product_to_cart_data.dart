import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class AddProductToCartData {
  CrudRequests crudRequests;
  AddProductToCartData({
    required this.crudRequests,
  });

  Future<Object> addProductToCartData({
    required String productId,
    required String colorProductId,
  }) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.searchProduct,
      data: {
        "product_id": productId,
        "colorproduct_id": colorProductId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

