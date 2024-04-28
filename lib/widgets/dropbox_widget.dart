import 'package:asymmetri_task/my_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropBoxWidget extends StatelessWidget {
  final MyFunctions myFunctions = Get.put(MyFunctions());
  final List<String> items = ['Green', 'Blue', 'Purple', 'Red'];

  DropBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Obx(
            () => DropdownButton<String>(
              value: myFunctions.getSelectedColor(),
              onChanged: (String? newValue) {
                myFunctions.updateSelectedColor(newValue!);
                print(myFunctions.getSelectedColor());
              },
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
