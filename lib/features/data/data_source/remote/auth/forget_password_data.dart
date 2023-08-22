import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class ForgetPasswordData {
  CrudRequests crudRequests;
  ForgetPasswordData({
    required this.crudRequests,
  });

  Future<Object> postForgetPasswordData({
    required String email,
  }) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.forgetPasswordCode,
      data: {
        "email": email,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
