import 'package:flutter/material.dart';

class ReservationCardWidget extends StatelessWidget {
  final dynamic data;
  const ReservationCardWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Text(data["name"]),
            ],
          ),
        )
      ],
    );
  }
}
