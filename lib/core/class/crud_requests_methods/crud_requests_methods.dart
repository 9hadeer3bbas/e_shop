import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../functions/check_internet_connection/check_internet_connection.dart';
import '../status_requests/status_requests.dart';

class CrudRequests {
  MyServices myServices = Get.find();
  Map<String, String>? headers = {};

  Future<Either<StatusRequest, Map<String, dynamic>>> getData({
    required String baseUrl,
  }) async {
    try {
      if (await checkInternetConnection()) {
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };

        var response = await http.get(Uri.parse(baseUrl), headers: headers);
        log("***********Status code : ${response.statusCode}");
        if (response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          log("*********Reseponse = $responseBody");
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log(error.toString());
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> getFormData({
    required String baseUrl,
  }) async {
    try {
      if (await checkInternetConnection()) {
        String token =
            myServices.sharedPreferences.getString("token").toString();

        Map<String, String> header = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };

        var response = await http.get(Uri.parse(baseUrl), headers: header);
        log("***********Status code : ${response.statusCode}");
        if (response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          log("*********Reseponse = $responseBody");
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log(error.toString());
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map<dynamic, dynamic>>> postData({
    required String linkUrl,
    required Map data,
  }) async {
    try {
      if (await checkInternetConnection()) {
        Map<String, String> header = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };
        var response = await http.post(
          Uri.parse(linkUrl),
          headers: header,
          body: json.encode(data),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          log(responseBody.toString());
          return Right(responseBody);
        } else if (response.statusCode == 422) {
          var responseBody = jsonDecode(response.body);
          log(responseBody.toString());
          return Right(responseBody);
        } else if (response.statusCode == 500) {
          return const Left(StatusRequest.serverfailure);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log("Error = $error");
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map<dynamic, dynamic>>> postData2({
    required String linkUrl,
    required Map data,
  }) async {
    try {
      if (await checkInternetConnection()) {
        String token =
            myServices.sharedPreferences.getString("token").toString();

        Map<String, String> header = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };

        var response = await http.post(
          Uri.parse(linkUrl),
          headers: header,
          body: json.encode(data),
        );
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body) as Map;
          log(responseBody.toString());
          return Right(responseBody);
        } else if (response.statusCode == 422) {
          var responseBody = jsonDecode(response.body) as Map;
          log(responseBody.toString());
          return Right(responseBody);
        } else if (response.statusCode == 401) {
          var responseBody = jsonDecode(response.body) as Map;
          log(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log("Error = $error");
      return const Left(StatusRequest.serverfailure);
    }
  }

  // ============================ Post FormData ============================
  Future<Either<StatusRequest, Map<String, dynamic>>> postFormData({
    required String linkUrl,
    required Map<String, String> data,
    File? imageFile,
  }) async {
    try {
      if (await checkInternetConnection()) {
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };
        http.MultipartRequest request =
            http.MultipartRequest('POST', Uri.parse(linkUrl));

        request.headers.addAll(headers!);

        if (imageFile != null) {
          File file = File(imageFile.path);
          request.files.add(http.MultipartFile(
              'imgURL', file.readAsBytes().asStream(), file.lengthSync(),
              filename: file.path.split('/').last));
        }

        Map<String, String> fieldsData = {};
        fieldsData.addAll(data);
        request.fields.addAll(fieldsData);

        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(await response.stream.bytesToString())
              as Map<String, dynamic>;
          log(responseBody.toString());
          return Right(responseBody);
        } else if (response.statusCode == 422) {
          var responseBody = jsonDecode(await response.stream.bytesToString())
              as Map<String, dynamic>;
          log(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log("Error = $error");
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> postFormData2({
    required String linkUrl,
    required Map<String, String> data,
    File? imageFile,
    File? imageFile2,
  }) async {
    try {
      if (await checkInternetConnection()) {
        String token =
            myServices.sharedPreferences.getString("token").toString();

        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };
        http.MultipartRequest request =
            http.MultipartRequest('POST', Uri.parse(linkUrl));

        request.headers.addAll(headers!);

        if (imageFile != null) {
          File file = File(imageFile.path);
          request.files.add(http.MultipartFile(
              'images[0]', file.readAsBytes().asStream(), file.lengthSync(),
              filename: file.path.split('/').last));
        }

        if (imageFile2 != null) {
          File file = File(imageFile2.path);
          request.files.add(http.MultipartFile(
              'images[1]', file.readAsBytes().asStream(), file.lengthSync(),
              filename: file.path.split('/').last));
        }

        Map<String, String> fieldsData = {};
        fieldsData.addAll(data);
        request.fields.addAll(fieldsData);

        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(await response.stream.bytesToString())
              as Map<String, dynamic>;
          log(responseBody.toString());
          return Right(responseBody);
        } else if (response.statusCode == 422) {
          var responseBody = jsonDecode(await response.stream.bytesToString())
              as Map<String, dynamic>;
          log(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log("Error = $error");
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> postConfirmCode({
    required String linkUrl,
    required Map data,
  }) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: data,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          log(response.statusCode.toString());
          int responseBody = jsonDecode(response.body);
          log(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      log("Error = $error");
      return const Left(StatusRequest.serverfailure);
    }
  }
}
