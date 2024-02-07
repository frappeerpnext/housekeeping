import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/main_controller.dart';
import 'package:housekeeping/screens/home/home_screen.dart';
import 'package:housekeeping/screens/widgets/main_drawer_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainController>();
    return SafeArea(
        bottom: false,
        child: Obx(
          () => Scaffold(
            appBar: AppBar(
              title: Text(controller.title.value),
            ),
            drawer: const MainDrawerWidget(),
            body: controller.getBodyWidget,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: Icon(Icons.bedroom_child),
                  label: 'Rooms',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: Icon(Icons.task),
                  label: 'My Task',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: controller.bottomNavigationBarIndexSelected.value,
              onTap: (int index) =>
                  controller.bottomNavigationBarIndexSelected(index),
            ),
          ),
        ));
  }
}
