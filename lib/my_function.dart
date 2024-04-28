import 'package:asymmetri_task/my_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//used this to store the colors and the functions used in widgets.

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
