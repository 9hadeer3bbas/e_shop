import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class ProductsWithinCategoryData {
  CrudRequests crudRequests;
  ProductsWithinCategoryData({
    required this.crudRequests,
  });

  Future<Object> getProductsWithinCategoryData({
    required String categoryId,
  }) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.getProducts,
      data: {
        "category_id": categoryId
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

