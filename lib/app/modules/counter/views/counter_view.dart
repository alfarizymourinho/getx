import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({Key? key}) : super(key: key);

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "Count: ${controller.count.value}", // Menggunakan controller.count.value.toString()
              style: TextStyle(
                fontSize: 20.0 + controller.count.value.toDouble(), // Menggunakan controller.count.value.toDouble()
              ),
            )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    controller.increment();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
