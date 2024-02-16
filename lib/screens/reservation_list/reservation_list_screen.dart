import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/reservation_list_controller.dart';
import 'package:housekeeping/screens/reservation_list/widgets/calendar_navigation_widget.dart';
import 'package:housekeeping/screens/reservation_list/widgets/group_reservation_card_widget.dart';

// ignore: must_be_immutable
class ReservationListScreen extends StatelessWidget {
  var controller = Get.put(ReservationListController());

  ReservationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text('Reservation List'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const CalendarNavigationWidget(),
                Column(
                  children: [
                    GroupReservationCardWidget(
                      data: controller.result["arrival"],
                      title: 'Arrival',
                    ),
                    GroupReservationCardWidget(
                      data: controller.result["stay_over"],
                      title: 'Stay Over',
                    ),
                    GroupReservationCardWidget(
                      data: controller.result["departure"],
                      title: 'Depature',
                    ),
                    controller.isLoading.value
                        ? Container()
                        : Text("${controller.result}"),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
