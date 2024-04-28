import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//used this to store the colors and the functions used in widgets.

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
const White = Color(0xFFFFFFFF);

class MyFunctions extends GetxController {
  final RxString selectedColor = 'Green'.obs;
  final RxInt totalItems = 1.obs;
  final RxInt itemsInLine = 1.obs;
  bool get isTotalItemsExceeded => totalItems.value > 30;

  void updateSelectedColor(String color) {
    selectedColor.value = color;
  }

  void updateTotalItems(int value) {
    totalItems.value = value;
  }

  void updateItemsInLine(int value) {
    itemsInLine.value = value;
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

  double get progressValue {
    if (totalItems.value == 0 || itemsInLine.value == 0) {
      return 0.0;
    }
    return itemsInLine.value / totalItems.value;
  }

  List<Color> get progressColors {
    switch (selectedColor.value) {
      case 'Blue':
        return [
          Blue,
          blueMid,
          blueSecondary,
        ];
      case 'Green':
        return [Green, greenMid, greenSecondary, White];
      case 'Red':
        return [Red, redMid, redSecondary, White];
      case 'Purple':
        return [Purple, purpleMid, purpleSecondary, White];
      case 'Blue':
        return [Blue, blueMid, blueSecondary, White];
      default:
        return [Green, greenMid, greenSecondary, White];
    }
  }
}
