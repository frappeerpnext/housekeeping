import 'package:flutter/material.dart';

class GroupReservationNoValueWidget extends StatelessWidget {
  final String text;
  const GroupReservationNoValueWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.bed_outlined,
              size: 40,
              color: Colors.grey,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
