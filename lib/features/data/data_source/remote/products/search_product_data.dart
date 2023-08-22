import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class SearchProductData {
  CrudRequests crudRequests;
  SearchProductData({
    required this.crudRequests,
  });

  Future<Object> getSearchProductData({
    required String name,
  }) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.searchProduct,
      data: {
        "name": name
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

