import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  const MainLayout({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
