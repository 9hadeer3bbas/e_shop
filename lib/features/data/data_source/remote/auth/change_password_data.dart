import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class ChangePasswordData {
  CrudRequests crudRequests;
  ChangePasswordData({
    required this.crudRequests,
  });

  Future<Object> postChangePasswordData({
    required String currentPassword,
    required String newPassword,
    required String newConfirmPassword,
  }) async {
    var response = await crudRequests.postData2(
      linkUrl: AppLinksApi.changePassword,
      data: {
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirmation": newConfirmPassword
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
