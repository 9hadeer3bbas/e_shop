import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class CategoryData {
  CrudRequests crudRequests;
  CategoryData({
    required this.crudRequests,
  });

  Future<Object> getCategoriesData() async {
    var response = await crudRequests.getData(
      baseUrl: AppLinksApi.allCategories,
    );
    return response.fold((l) => l, (r) => r);
  }
}

