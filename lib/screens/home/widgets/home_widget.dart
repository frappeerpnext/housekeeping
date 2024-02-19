import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/home_controller.dart';
import 'package:housekeeping/screens/home/widgets/home_occupancy_widget.dart';
import 'package:housekeeping/screens/home/widgets/home_room_status_widget.dart';
import 'package:housekeeping/screens/home/widgets/home_summary_widget.dart';
import 'package:housekeeping/screens/home/widgets/home_system_date_card_widget.dart';
import 'package:housekeeping/screens/home/widgets/home_wellcome_text_widget.dart';

class HomeWidget extends StatelessWidget {
  final Map<dynamic, dynamic> dashboardData;
  final bool isLoading;
  const HomeWidget(
      {Key? key, required this.dashboardData, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return isLoading
        ? const Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.grey[200],
            body: RefreshIndicator(
              onRefresh: controller.onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    HomeWellcomeTextWidget(dashboardData: dashboardData),
                    const SizedBox(height: 10),
                    HomeSystemDateCardWidget(dashboardData: dashboardData),
                    const SizedBox(height: 10),
                    HomeOccupancyWidget(dashboardData: dashboardData),
                    const SizedBox(height: 10),
                    HomeSumaryWidget(dashboardData: dashboardData),
                    const SizedBox(height: 10),
                    HomeRoomStatusWidget(dashboardData: dashboardData),
                  ],
                ),
              ),
            ),
          );
  }
}
