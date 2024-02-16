import 'package:flutter/material.dart';
import 'package:housekeeping/screens/reservation_list/widgets/group_reservation_card_title.dart';
import 'package:housekeeping/screens/reservation_list/widgets/reservation_card_widget.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title),
        const SizedBox(height: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GroupReservationCardTitle(title: title, total: data.length),
        ]),
        ...(data).map((e) => ReservationCardWidget(
              data: e,
            ))
      ],
    );
  }
}
