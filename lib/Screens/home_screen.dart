import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/Controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Obx(() {
                return Text(
                  '${controller.count}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // onPressed: controller.increment(),
          onPressed: (){
            controller.count.value=controller.count.value+1;
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
