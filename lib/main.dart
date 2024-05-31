import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Controller extends GetxController {
  // Define an observable variable
  var count = 0.obs; // ".obs" makes it observable

  // Increase the count
  void increaseCount() {
    count++;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instantiate the controller at the top level
    print('rebuild');
    final Controller controller = Get.put(Controller());

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Obx Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the current count using Obx
              Obx(() {
                return Text('Count: ${controller.count}');
              }),

              // Button to increase the count
              ElevatedButton(
                onPressed: controller.increaseCount,
                child: Text('Increase Count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
