import 'dart:async';
import 'package:asymmetri_task/my_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingBarController extends GetxController {
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
}

class LoadingBar extends StatelessWidget {
  final double progress;

  const LoadingBar({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingBarController controller = Get.put(LoadingBarController());
    final MyFunctions myFunctions = Get.find<MyFunctions>();

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
            colors: myFunctions.progressColors,
          ),
        ),
        child: FractionallySizedBox(
          widthFactor: progress,
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
