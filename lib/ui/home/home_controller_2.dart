import 'package:get/get.dart';

class HomeControllerTwo extends GetxController {
  RxInt count2 = 0.obs;

  void increment() {
    count2.value++;
  }
}