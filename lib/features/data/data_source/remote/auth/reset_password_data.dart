import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class ResetPasswordData {
  CrudRequests crudRequests;
  ResetPasswordData({
    required this.crudRequests,
  });

  Future<Object> postResetPasswordData({
    required String code,
    required String password,
    required String passwordConfirm,
  }) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.resetPassword,
      data: {
        "code": code,
        "password": password,
        "password_confirmation": passwordConfirm
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
