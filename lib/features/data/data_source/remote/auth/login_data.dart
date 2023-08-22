import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class LoginData {
  CrudRequests crudRequests;
  LoginData({
    required this.crudRequests,
  });

  Future<Object> postData({
    required String email,
    required String password,
  }) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.login,
      data: {
        "email": email,
        "password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
