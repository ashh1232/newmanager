import 'package:newmanager/class/statusrequest.dart';

handlingData(respo) {
  if (respo is StatusRequest) {
    return respo;
  } else {
    return StatusRequest.success;
  }
}
