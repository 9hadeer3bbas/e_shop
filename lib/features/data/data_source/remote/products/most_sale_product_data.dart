import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class MostSaleProductData {
  CrudRequests crudRequests;
  MostSaleProductData({
    required this.crudRequests,
  });

  Future<Object> getMostSaleProductData() async {
    var response = await crudRequests.getData(
      baseUrl: AppLinksApi.showMostSaleProduct,
    );
    return response.fold((l) => l, (r) => r);
  }
}

