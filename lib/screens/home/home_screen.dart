import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/home_controller.dart';
import 'package:housekeeping/screens/home/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    // var today = controller.dashboardData["working_date"];
    return Obx(() => DefaultTabController(
          initialIndex: controller.tabBarIndex.value,
          length: 3, // Number of tabs
          child: Scaffold(
            body: Column(
              children: [
                // Your other content here (e.g., an image)
                TabBar(
                  controller: controller.tabController,
                  onTap: controller.onTabBarPressed,
                  tabs: const [
                    Tab(text: 'Yesterday'),
                    Tab(text: 'Today'),
                    Tab(text: 'Tomorrow'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      HomeWidget(
                        isLoading: controller.isYesterdayData.value,
                        dashboardData: controller.yesterdayDashboardData,
                      ),
                      HomeWidget(
                        isLoading: controller.isLoadTodayData.value,
                        dashboardData: controller.todayDashboardData,
                      ),
                      HomeWidget(
                        isLoading: controller.isLoadTomorrowData.value,
                        dashboardData: controller.tomorrowDashboardData,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
