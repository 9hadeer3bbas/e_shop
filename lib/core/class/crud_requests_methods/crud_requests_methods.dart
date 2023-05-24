import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../functions/check_internet_connection/check_internet_connection.dart';
import '../status_requests/status_requests.dart';

class CrudRequests {
  Future<Either<StatusRequest, Map<String, dynamic>>> getData(
      String baseUrl) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.get(Uri.parse(baseUrl));
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          log(responseBody);
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
}
