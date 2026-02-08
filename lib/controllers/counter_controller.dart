import 'package:get/get.dart';

// .obs - Reactive - realtime - obser - int - RxInt (OBX)
// String -  RxString
// GetBuilder - No reactive
// GetX - No reactive

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  // int counter = 0;

  void increment() {
    counter.value++;
  }

  // void increment() {
  //   counter++;
  //   update();
  // }
}
