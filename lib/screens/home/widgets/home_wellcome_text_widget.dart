import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';

class HomeWellcomeTextWidget extends StatelessWidget {
  const HomeWellcomeTextWidget({super.key, required Map dashboardData});

  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      var now = DateTime.now();
      var hour = now.hour;
      if (hour >= 0 && hour < 12) {
        return 'Good morning,';
      } else if (hour >= 12 && hour < 18) {
        return 'Good afternoon,';
      } else {
        return 'Good evening,';
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GetBuilder<LoginController>(
            builder: (controller) => Row(
              children: [
                Text(
                  getGreeting(),
                ),
                const SizedBox(width: 5),
                Text(
                  controller.usernameInput.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
