import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const Blue = Color(0xFF6295D9);
const blueMid = Color(0xFF30618C);
const blueSecondary = Color(0xFF143F59);
const Green = Color(0xFF46A649);
const greenMid = Color(0xFF287B2B);
const greenSecondary = Color(0xFF044906);
const Red = Color(0xFfB74D4D);
const redMid = Color(0xFF8D2A2A);
const redSecondary = Color(0xFF5F0404);
const Purple = Color(0xFF5E49B2);
const purpleMid = Color(0xFF5C29D2);
const purpleSecondary = Color(0xFF5A07F5);

class MyFunctions extends GetxController {
  final RxString selectedColor = 'Green'.obs;

  void updateSelectedColor(String color) {
    selectedColor.value = color;
  }

  String getSelectedColor() {
    return selectedColor.value;
  }

  final Map<String, Color> colorMap = {
    'Blue': Blue,
    'Green': Green,
    'Red': Red,
    'Purple': Purple,
  };

  Color get selectedColorValue => colorMap[selectedColor.value]!;

  static String getSliderText(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Slow';
      case 1:
        return 'Smooth';
      case 2:
        return 'Fast';
      default:
        return '';
    }
  }
}
