import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/main_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainController>();
    return Container(
      child: Text("Search"),
    );
  }
}
