import 'package:asymmetri_task/my_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderController extends GetxController {
  final RxDouble value = 0.0.obs;
  final MyFunctions myFunctions = Get.find<MyFunctions>();

  void onValueChanged(double newValue) {
    value.value = newValue.clamp(0.0, 2.0);
    update();
  }
}

class CustomSlider extends StatelessWidget {
  final CustomSliderController controller = Get.put(CustomSliderController());
  final MyFunctions myFunctions = Get.find<MyFunctions>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Obx(
            () => Column(
              children: [
                Slider(
                  min: 0.0,
                  max: 2.0,
                  label: MyFunctions.getSliderText(controller.value.value),
                  divisions: 2,
                  activeColor: myFunctions.selectedColorValue,
                  inactiveColor: myFunctions.selectedColorValue,
                  thumbColor: myFunctions.selectedColorValue,
                  value: controller.value.value,
                  onChanged: controller.onValueChanged,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
