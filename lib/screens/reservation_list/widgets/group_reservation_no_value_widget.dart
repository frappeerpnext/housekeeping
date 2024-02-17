import 'package:flutter/material.dart';

class GroupReservationNoValue extends StatelessWidget {
  final String text;
  const GroupReservationNoValue({super.key, required this.text});

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
            Text(text),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
