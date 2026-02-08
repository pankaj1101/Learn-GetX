import 'package:get/get.dart';

class SlidingController extends GetxController {
  RxDouble sliderValue = 0.0.obs;

  void onChangeSlider(double value) {
    sliderValue.value = value;
  }
}
