import 'package:flutter/material.dart';

class BlankLayout extends StatelessWidget {
  final Widget body;
  const BlankLayout({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }
}
