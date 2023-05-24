import '../../class/status_requests/status_requests.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
