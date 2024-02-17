import 'package:flutter/material.dart';

class ReservationStatusWidget extends StatelessWidget {
  final Color color;
  final String status;
  const ReservationStatusWidget(
      {super.key, required this.color, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
