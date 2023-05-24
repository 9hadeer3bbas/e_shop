import 'package:get/get.dart';

validationOnInput({
  required String value,
  required int min,
  required int max,
  required String type,
}) {
  if (type == "Username") {
    if (!GetUtils.isUsername(value)) {
      return "يجب أن تدخل اسم المستخدم";
    }
  }
  if (type == "Email") {
    if (!GetUtils.isEmail(value)) {
      return "يجب أن تدخل البريد الإلكتروني";
    }
  }
  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "يجب أن تدخل رقم الموبايل";
    }
  }
  if (type == "Password") {
    if (!value.contains(RegExp('[0-9a-zA-Z]|[@]|[%]|[&]|[#]|[=]|[+]|[-]'))) {
      return "يجب ان تدخل كلمة المرور";
    }
  }

  if (value.isEmpty) {
    return "لا يمكن أن يكون هذا الحقل فارغ";
  }

  if (value.length < min) {
    return "لا يمكن أن يكون أقل من $min";
  }
  if (value.length > max) {
    return "لا يمكن أن يكون أكثر من $max";
  }
}
