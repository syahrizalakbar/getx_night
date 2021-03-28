import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_controller_2.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeControllerTwo());
  }

}