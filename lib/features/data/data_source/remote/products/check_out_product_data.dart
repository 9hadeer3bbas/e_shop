import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class CheckOutProductData {
  CrudRequests crudRequests;
  CheckOutProductData({
    required this.crudRequests,
  });

  Future<Object> checkOutProductData({
    required String regionId,
    required String details,
    required String total,
  }) async {
    var response = await crudRequests.postData2(
      linkUrl: AppLinksApi.checkout,
      data: {
        "region_id": regionId,
        "details": details,
        "total": total,
        "statue": true
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
