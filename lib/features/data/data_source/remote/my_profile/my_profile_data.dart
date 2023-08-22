import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class MyProfileData {
  CrudRequests crudRequests;
  MyProfileData({
    required this.crudRequests,
  });

  Future<Object> getMyProfileData() async {
    var response = await crudRequests.getFormData(
      baseUrl: AppLinksApi.myProfile,
    );

    return response.fold((l) => l, (r) => r);
  }
}
