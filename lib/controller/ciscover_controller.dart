import 'package:get/get.dart';

class DiscoverController extends GetxController {
  var h = false; // Reactive variable using RxBool

  void toggleH() {
    h = !h; // Toggle the value
    update(); // Print the current state
  }
}
