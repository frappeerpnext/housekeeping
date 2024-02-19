import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/reservation_list_controller.dart';
import 'package:housekeeping/screens/reservation_list/widgets/group_reservation_card_title.dart';
import 'package:housekeeping/screens/reservation_list/widgets/group_reservation_no_value_widget.dart';
import 'package:housekeeping/screens/reservation_list/widgets/reservation_card_widget.dart';
import 'package:intl/intl.dart';

class GroupReservationCardWidget extends StatelessWidget {
  final String title;
  final List<dynamic> data;
  const GroupReservationCardWidget({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReservationListController>();
    String formattedDate =
        DateFormat("dd-MM-yyyy").format(controller.currentSelectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GroupReservationCardTitle(title: title, total: data.length),
          //
        ]),
        const SizedBox(height: 10),
        data.isEmpty
            ? GroupReservationNoValueWidget(
                text: "Thers is no $title on $formattedDate")
            : Column(
                children: (data)
                    .map((e) => ReservationCardWidget(
                          data: e,
                        ))
                    .toList(),
              ),
      ],
    );
  }
}
