import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/home_controller.dart';
import 'package:housekeeping/controllers/login_controller.dart';
import 'package:housekeeping/widgets/sub_widgets/main_widget.dart';
import 'package:intl/intl.dart';

import '../../widgets/sub_widgets/system_date.dart';

class HomeSecondTabScreen extends StatelessWidget {
  const HomeSecondTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                const WellcomeText(),
                const SizedBox(height: 10),
                const SystemDate(),
                const SizedBox(height: 10),
                const OccupancyChart(),
                const SizedBox(height: 10),
                const Summary(),
                const SizedBox(height: 10),
                Container(
                  width: 400,
                  height: 335,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            'Room Status',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.block,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                      SizedBox(width: 25),
                                      Text(
                                        'Room Block',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${controller.dashboardData['total_room_block']}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.blue),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.cleaning_services,
                                        color: Colors.grey[600],
                                        size: 30,
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Occupy Dirty',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.brown[500],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${controller.dashboardData['total_room_occupy']}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.blue),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.water_drop,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                      SizedBox(width: 25),
                                      Text(
                                        'Vacant Clean',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${controller.dashboardData['total_room_occupy']}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.blue),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.cleaning_services,
                                        color: Colors.orange[600],
                                        size: 30,
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Vacant Dirty',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[800],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                              '${controller.dashboardData['total_room_occupy']}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.blue),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.water_drop,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      SizedBox(width: 25),
                                      Text(
                                        'Occupy Cleaned',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[400],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${controller.dashboardData['total_room_occupy']}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.blue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
