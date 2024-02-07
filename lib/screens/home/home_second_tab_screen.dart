import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/home_controller.dart';

class HomeSecondTabScreen extends StatelessWidget {
  const HomeSecondTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Column(
      children: [
        Text(
          "Total Room: ${controller.dashboardData["total_room"].toString()}",
        ),
        Text(
          "Total Room Occupy: ${controller.dashboardData["total_room_occupy"].toString()}",
        ),
        Text(
          "Rotal Room Vacant: ${controller.dashboardData["total_room_vacant"].toString()}",
        ),
      ],
    );
  }
}
