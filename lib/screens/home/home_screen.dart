import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/home_controller.dart';
import 'package:housekeeping/screens/home/home_first_tab_screen.dart';
import 'package:housekeeping/screens/home/home_second_tab_screen.dart';
import 'package:housekeeping/screens/home/home_third_tab_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return const DefaultTabController(
      initialIndex: 1,
      length: 3, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            // Your other content here (e.g., an image)
            TabBar(
              tabs: [
                Tab(text: 'Last Week'),
                Tab(text: 'Today'),
                Tab(text: 'Yesterday'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomeFirstTabScreen(),
                  HomeSecondTabScreen(),
                  HomeThirdTabScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
