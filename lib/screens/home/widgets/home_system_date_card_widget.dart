import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeSystemDateCardWidget extends StatelessWidget {
  final Map<dynamic, dynamic> dashboardData;
  const HomeSystemDateCardWidget({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                DateFormat('EEEE')
                    .format(DateTime.parse(dashboardData["working_date"])),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('d')
                    .format(DateTime.parse(dashboardData["working_date"])),
                style: TextStyle(
                  color: Colors.orange[400],
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('MMMM y')
                    .format(DateTime.parse(dashboardData["working_date"])),
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
    );
  }
}
