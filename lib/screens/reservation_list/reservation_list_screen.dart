import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/reservation_list_controller.dart';
import 'package:housekeeping/screens/reservation_list/widgets/calendar_navigation_widget.dart';
import 'package:housekeeping/screens/reservation_list/widgets/group_reservation_card_widget.dart';

class ReservationListScreen extends StatelessWidget {
  final ReservationListController controller =
      Get.put(ReservationListController());

  ReservationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text('Reservation List'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CalendarNavigationWidget(),
              const SizedBox(height: 5),
              controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GroupReservationCardWidget(
                              data: controller.result["arrival"] ?? [],
                              title: 'Arrival',
                            ),
                            GroupReservationCardWidget(
                              data: controller.result["stay_over"] ?? [],
                              title: 'Stay Over',
                            ),
                            GroupReservationCardWidget(
                              data: controller.result["departure"] ?? [],
                              title: 'Departure',
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
