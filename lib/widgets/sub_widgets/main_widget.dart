import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/home_controller.dart';
import '../../controllers/login_controller.dart';

// Welcome text
class WellcomeText extends StatelessWidget {
  const WellcomeText({super.key});

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

//system date
class SystemDate extends StatelessWidget {
  const SystemDate({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 400,
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple[300],
        ),
        child: Column(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 5),
                  child: Row(
                    children: [
                      Text(
                        'System Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat('EEEE').format(
                      DateTime.parse(controller.dashboardData["working_date"])),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('d').format(
                      DateTime.parse(controller.dashboardData["working_date"])),
                  style: TextStyle(
                    color: Colors.orange[400],
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('MMMM y').format(
                      DateTime.parse(controller.dashboardData["working_date"])),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Occupacy
class OccupancyChart extends StatelessWidget {
  const OccupancyChart({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Container(
      width: 400,
      height: 260,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Occupancy",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Row(
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              color: Colors.green,
                              value: double.parse(
                                  '${controller.dashboardData['total_room_occupy']}'),
                              title: '',
                              radius: 35,
                              titleStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.orange,
                              value: double.parse(
                                  '${controller.dashboardData['total_room_vacant']}'),
                              title: '',
                              radius: 35,
                              titleStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                          sectionsSpace: 2,
                          centerSpaceRadius: 50,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${controller.dashboardData["occupancy"]}'
                          '%',
                          style: const TextStyle(
                            fontSize: 23,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 7),
                SizedBox(
                  height: 180,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Occupy',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${controller.dashboardData['total_room_occupy']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Vacant',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${controller.dashboardData['total_room_vacant']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Total Rooms',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${controller.dashboardData['total_room']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

//Summery
class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

    return Container(
      width: 400,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0, left: 10, top: 5),
                  child: Row(
                    children: [
                      Text(
                        "Summary",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text(
                              'Arrival',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${controller.dashboardData['arrival'].toInt()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 180,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text(
                              'Stay Over',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${controller.dashboardData['stay_over'].toInt()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 180,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text(
                              'Departure',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${controller.dashboardData['departure'].toInt()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 180,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.pink[300],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${controller.dashboardData['total_cancelled'].toInt()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
