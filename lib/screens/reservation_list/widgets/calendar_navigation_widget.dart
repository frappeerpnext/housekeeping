import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/reservation_list_controller.dart';
import 'package:intl/intl.dart';

class CalendarNavigationWidget extends StatelessWidget {
  const CalendarNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReservationListController>();

    return Column(
      children: [
        CalendarWeek(
          controller: controller.calendarCtr.value,
          height: 120,
          showMonth: true,
          minDate: DateTime.now().add(
            Duration(days: -365),
          ),
          maxDate: DateTime.now().add(
            Duration(days: 365),
          ),
          onDatePressed: (DateTime datetime) {
            // Do something
            controller.onLoadReservationList(datetime);
          },
       
          monthViewBuilder: (DateTime time) => Align(
            alignment: FractionalOffset.center,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                DateFormat.yMMMM().format(time),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
