import 'package:asymmetri_task/my_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.hintText = "",
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final MyFunctions myFunctions = Get.find<MyFunctions>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Obx(
        () => TextField(
          controller: controller,
          style: TextStyle(
            color: myFunctions.selectedColorValue,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(14.0),
            filled: true,
            focusedBorder: getInputBorder(myFunctions.selectedColorValue),
            enabledBorder: getInputBorder(myFunctions.selectedColorValue),
            border: getInputBorder(myFunctions.selectedColorValue),
            labelText: hintText,
            labelStyle: TextStyle(
              color: myFunctions.selectedColorValue,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  OutlineInputBorder getInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(color: color),
    );
  }
}
