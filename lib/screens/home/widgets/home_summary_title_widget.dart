import 'package:flutter/material.dart';

class HomeSummaryTitleWidget extends StatelessWidget {
  const HomeSummaryTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
    );
  }
}
