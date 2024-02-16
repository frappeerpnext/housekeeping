import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeOccupancyWidget extends StatelessWidget {
  final Map<dynamic, dynamic> dashboardData;
  const HomeOccupancyWidget({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              color: Colors.green, // Color for occupied rooms
                              value: double.parse(
                                  '${dashboardData['total_room_occupy']}'), // Value representing occupied rooms
                              title: '', // No title for this section
                              radius: 35, // Radius of this section
                              titleStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .white, // Title style for occupied rooms
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.orange, // Color for vacant rooms
                              value: double.parse(
                                  '${dashboardData['total_room_vacant']}'), // Value representing vacant rooms
                              title: '', // No title for this section
                              radius: 35, // Radius of this section
                              titleStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .black, // Title style for vacant rooms
                              ),
                            ),
                          ],
                          sectionsSpace: 2, // Space between sections
                          centerSpaceRadius: 50, // Radius of the center space
                        ),
                      ),
                      Center(
                        child: Text(
                          '${dashboardData["occupancy"]}'
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
                                '${dashboardData['total_room_occupy']}',
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
                                '${dashboardData['total_room_vacant']}',
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
                                '${dashboardData['total_room']}',
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
