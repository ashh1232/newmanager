import 'package:get/get.dart';
import 'package:newmanager/class/api_service.dart';
import 'package:newmanager/class/crud.dart';
import 'package:newmanager/controller/myhome_controller.dart';
import 'package:newmanager/controller/testcontroller.dart';

import '../controller/home_screen_controller.dart';
import '../controller/ciscover_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);
    Get.lazyPut<TestControsller>(() => TestControsller(), fenix: true);
    Get.lazyPut<DiscoverController>(() => DiscoverController(), fenix: true);
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
      fenix: true,
    );
  }
}
