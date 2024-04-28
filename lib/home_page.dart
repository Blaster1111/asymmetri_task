import 'package:asymmetri_task/my_data.dart';
import 'package:asymmetri_task/my_function.dart';
import 'package:asymmetri_task/widgets/dropbox_widget.dart';
import 'package:asymmetri_task/widgets/loading_bar_widget.dart';
import 'package:asymmetri_task/widgets/slider_widget.dart';
import 'package:asymmetri_task/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//used this page to call all the widgets
//initailized my functions to pass values to the widgets.
class HomePage extends StatelessWidget {
  final MyData myData = MyData();
  final MyFunctions myFunctions = Get.find<MyFunctions>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropBoxWidget(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              CustomSlider(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              TextFieldWidget(
                controller: myData.totalItemsController,
                hintText: "Total Items",
                onChanged: (value) {
                  myFunctions.updateTotalItems(int.parse(value));
                },
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              TextFieldWidget(
                controller: myData.itemsInLineController,
                hintText: "Items in line",
                onChanged: (value) {
                  myFunctions.updateItemsInLine(int.parse(value));
                },
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    myFunctions.totalItems.value,
                    (index) => LoadingBar(
                      progress: myFunctions.progressValue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
