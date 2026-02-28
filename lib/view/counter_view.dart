import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});

  final counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Obx(() {
        //   return Text(
        //     counterController.counter.value.toString(),
        //     style: TextStyle(fontSize: 30),
        //   );
        // }),
        // child: GetX<CounterController>(
        //   init: CounterController(),
        //   builder: (controller) {
        //     return Text(
        //       controller.counter.toString(),
        //       style: TextStyle(fontSize: 30),
        //     );
        //   },
        // ),

        child: GetBuilder<CounterController>(
          builder: (controller) {
            return Text(
              controller.counter.toString(),
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
