import 'package:flutter/material.dart';

class SystemDateWidget extends StatelessWidget {
  final String label;
  const SystemDateWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}
