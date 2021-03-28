import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_night/ui/home/home_controller.dart';
import 'package:getx_night/ui/home/home_controller_2.dart';
import 'package:getx_night/ui/page_two/page_two.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: CountView(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Get.find<HomeController>().increment();
              Get.find<HomeControllerTwo>().increment();
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            onPressed: () {
              Get.to(PageTwo());
            },
          ),
        ],
      ),
    );
  }
}

class CountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
            () {
          return Column(
            children: [
              Text(
                "${Get.find<HomeController>().count}",
                style: TextStyle(fontSize: 48),
              ),
              Text(
                "${Get.find<HomeControllerTwo>().count2}",
                style: TextStyle(fontSize: 48),
              ),
            ],
          );
        },
      ),
    );
  }
}
