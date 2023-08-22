import 'package:get/get.dart';

validationOnInput({
  required String value,
  required int min,
  required int max,
  String? type,
}) {
  if (type == "FirstName") {
    if (!GetUtils.isUsername(value)) {
      return "The first name field is required";
    }
    if (GetUtils.isHTML(value)) {
      return "You can not enter this the expresssion";
    }
  }

  if (type == "LastName") {
    if (!GetUtils.isUsername(value)) {
      return "The last name field is required";
    }
    if (GetUtils.isHTML(value)) {
      return "You can not enter this the expresssion";
    }
  }

  if (type == "Email") {
    if (!GetUtils.isEmail(value)) {
      return "The email field is required";
    }
    if (GetUtils.isHTML(value)) {
      return "You can not enter this the expresssion";
    }
  }

  if (type == "Password") {
    if (!value.contains(RegExp('[0-9a-zA-Z]|[@]|[%]|[&]|[#]|[=]|[+]|[-]'))) {
      return "The password field is required";
    }
    if (GetUtils.isHTML(value)) {
      return "You can not enter this the expresssion";
    }
  }

  if (type == "search") {
    if (GetUtils.isHTML(value)) {
      return "You can not enter this the expresssion";
    }
    if (value.isEmpty) {
      return "this the field is required";
    }
  }
  
  if (GetUtils.isHTML(value)) {
    return "You can not enter this the expresssion";
  }

  if (value.isEmpty) {
    return "this the field is required";
  }

  if (value.length < min) {
    return "the field can't be lower than $min";
  }
  if (value.length > max) {
    return "the field can't be larger than $max";
  }
}
