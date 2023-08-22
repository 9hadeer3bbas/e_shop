import 'dart:io';
import 'package:eshop_app/core/class/crud_requests_methods/crud_requests_methods.dart';
import 'package:eshop_app/core/constant/links_apis/links_api.dart';

class SignUpData {
  CrudRequests crudRequests;
  SignUpData({
    required this.crudRequests,
  });

  Future<Object> postUserFormData(
      {required String firstName,
      String? lastName,
      required String email,
      required String password,
      required String type,
      String? gender,
      String? birthday,
      File? image,
      int? isConfirmed}) async {
    var response = await crudRequests.postFormData(
      imageFile: image,
      linkUrl: AppLinksApi.signUp,
      data: {
        'first_name': firstName,
        'last_name': lastName!,
        'email': email,
        'password': password,
        'type': type,
        'genderU': gender!,
        'birthday': birthday!,
      },
    );

    return response.fold((l) => l, (r) => r);
  }

  Future<Object> postCompanyFormData(
      {required String firstName,
      required String email,
      required String password,
      required String type,
      required String owner,
      required String isConfirmed}) async {
    var response = await crudRequests.postData(
      linkUrl: AppLinksApi.signUp,
      data: {
        'first_name': firstName,
        'email': email,
        'password': password,
        'type': type,
        'owner': owner,
        'is_confirmed': isConfirmed
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}
