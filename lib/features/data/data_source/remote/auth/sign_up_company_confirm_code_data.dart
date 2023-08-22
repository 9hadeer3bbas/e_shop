import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class SignUpCompanyConfirmCodeData {
  CrudRequests crudRequests;
  SignUpCompanyConfirmCodeData({
    required this.crudRequests,
  });

  Future<Object> postConfirmCode({
    required String compamyName,
    required String code,
  }) async {
    var response = await crudRequests.postConfirmCode(
      linkUrl: AppLinksApi.companyConfirmedCode,
      data: {
        'company_name': compamyName,
        'code': code,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
