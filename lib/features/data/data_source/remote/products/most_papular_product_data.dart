import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class MostPapularProductData {
  CrudRequests crudRequests;
  MostPapularProductData({
    required this.crudRequests,
  });

  Future<Object> getMostPapularProductData() async {
    var response = await crudRequests.getData(
      baseUrl: AppLinksApi.showMostPopularProduct,
    );
    return response.fold((l) => l, (r) => r);
  }
}

