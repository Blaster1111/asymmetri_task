import 'dart:async';

import 'package:asymmetri_task/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyData1 {
  static const List<String> items = ['Green', 'Blue', 'Purple', 'Red'];
  static const List<Color> progressColors = [
    Green,
    greenMid,
    greenSecondary,
    Colors.white,
  ];
}

class LoadingBarController extends GetxController {
  final RxDouble progress = 0.35.obs;
  final RxDouble animationValue = 0.0.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      animationValue.value += 0.01;
      if (animationValue.value >= 1.0) {
        animationValue.value = 0.0;
      }
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void updateProgress(double newValue) {
    progress.value = newValue.clamp(0.0, 1.0);
    update();
  }
}

class LoadingBar extends StatelessWidget {
  final LoadingBarController controller = Get.put(LoadingBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black),
          gradient: LinearGradient(
            begin: Alignment(-1.0, -1.0),
            end: Alignment(controller.animationValue.value * 2.0 - 1.0, 0.0),
            colors: MyData1.progressColors,
          ),
        ),
        child: FractionallySizedBox(
          widthFactor: controller.progress.value,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
