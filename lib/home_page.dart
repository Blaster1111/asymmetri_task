import 'package:asymmetri_task/my_data.dart';
import 'package:asymmetri_task/widgets/dropbox_widget.dart';
import 'package:asymmetri_task/widgets/loading_bar_widget.dart';
import 'package:asymmetri_task/widgets/slider_widget.dart';
import 'package:asymmetri_task/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final MyData myData = MyData();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.03,
            ),
            TextFieldWidget(
              controller: myData.itemsInLineController,
              hintText: "Items in line",
            ),
            LoadingBar(),
          ],
        ),
      ),
    );
  }
}
