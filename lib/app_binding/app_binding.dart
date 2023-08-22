import 'package:get/get.dart';

import '../core/class/crud_requests_methods/crud_requests_methods.dart';
import '../features/controller/account/account_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CrudRequests());
    Get.put(AccountScreenControllerImpl());
  }
}
