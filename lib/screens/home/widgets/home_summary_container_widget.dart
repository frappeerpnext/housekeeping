import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/screens/reservation_list/reservation_list_screen.dart';

class HomeSummaryContainerWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String data;
  const HomeSummaryContainerWidget(
      {super.key,
      required this.color,
      required this.title,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => ReservationListScreen());
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                data,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
