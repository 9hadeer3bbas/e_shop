import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class LogOutData {
  CrudRequests crudRequests;
  LogOutData({
    required this.crudRequests,
  });

  Future<Object> logOutData() async {
    var response = await crudRequests.postData2(
      linkUrl: AppLinksApi.logout,
      data: {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
