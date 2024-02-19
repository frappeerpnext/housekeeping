import 'package:flutter/material.dart';
import 'package:housekeeping/screens/home/widgets/home_summary_cancel_widget.dart';
import 'package:housekeeping/screens/home/widgets/home_summary_container_widget.dart';
import 'package:housekeeping/screens/home/widgets/home_summary_title_widget.dart';

class HomeSumaryWidget extends StatelessWidget {
  final Map<dynamic, dynamic> dashboardData;
  const HomeSumaryWidget({super.key, required this.dashboardData});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                const HomeSummaryTitleWidget(),
                Row(
                  children: [
                    HomeSummaryContainerWidget(
                      color: Colors.green,
                      title: 'Arrival',
                      data: '${dashboardData['arrival'].toInt()}',
                    ),
                    const SizedBox(width: 15),
                    HomeSummaryContainerWidget(
                      color: Colors.orange,
                      title: 'Stay Over',
                      data: '${dashboardData['stay_over'].toInt()}',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    HomeSummaryContainerWidget(
                      color: Colors.red.shade300,
                      title: 'Departure',
                      data: '${dashboardData['departure'].toInt()}',
                    ),
                    const SizedBox(width: 15),
                    HomeSummaryCancelWidget(
                      color: Colors.pink.shade300,
                      title: 'Cancel',
                      data: '${dashboardData['total_cancelled'].toInt()}',
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
