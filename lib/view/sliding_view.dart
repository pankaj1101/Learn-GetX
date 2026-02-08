import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/sliding_controller.dart';

class SlidingView extends StatelessWidget {
  SlidingView({super.key});

  final slidController = Get.put(SlidingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(
          () => Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent.withValues(
                    alpha: slidController.sliderValue.value,
                  ),
                ),
              ),
              Slider(
                value: slidController.sliderValue.value,
                onChanged: slidController.onChangeSlider,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
