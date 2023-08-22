import '../../../../../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../../../../../core/constant/links_apis/links_api.dart';

class RegionsData {
  CrudRequests crudRequests;
  RegionsData({
    required this.crudRequests,
  });

  Future<Object> getRegionsData() async {
    var response = await crudRequests.getData(
      baseUrl: AppLinksApi.getAllRegions,
    );
    return response.fold((l) => l, (r) => r);
  }
}

