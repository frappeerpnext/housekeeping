import 'package:flutter/material.dart';
import 'package:housekeeping/constants/constant.dart';
import 'package:housekeeping/widgets/reservation_status_widget.dart';
import 'package:intl/intl.dart'; // Import intl package

class ReservationCardWidget extends StatelessWidget {
  final dynamic data;
  const ReservationCardWidget({Key? key, required this.data}) : super(key: key);

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  String _calculateDateDifference(String arrivalDate, String departureDate) {
    DateTime arrival = DateTime.parse(arrivalDate);
    DateTime departure = DateTime.parse(departureDate);
    Duration difference = departure.difference(arrival);
    return '${difference.inDays} days';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 45.0, right: 30, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["guest_name"],
                          style:
                              TextStyle(fontSize: 17, color: Colors.blue[900]),
                        ),
                        ReservationStatusWidget(
                          color: HexColor.fromHex(data["status_color"]),
                          status: '${data["reservation_status"]}',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0, top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              (data["reservation"]),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue[400]),
                            ),
                            const SizedBox(width: 3),
                            const Text("-"),
                            const SizedBox(width: 3),
                            Text(
                              (data["name"]),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue[400]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 15,
                              color: Colors.blue[900],
                            ),
                            const SizedBox(width: 10),
                            Text(_formatDate(data["arrival_date"]),
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blue[900])),
                            const SizedBox(width: 3),
                            const Text("-"),
                            const SizedBox(width: 3),
                            Text(_formatDate(data["departure_date"]),
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blue[900])),
                            const SizedBox(width: 10),
                            Align(
                              alignment: const Alignment(0, 0.5),
                              child: Text(
                                '(${_calculateDateDifference(data["arrival_date"], data["departure_date"])})',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blue[900]),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.apartment,
                              size: 15,
                              color: Colors.blue[900],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              (data["business_source"]),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue[900]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bed,
                              size: 15,
                              color: Colors.blue[900],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              (data["room_type_alias"]),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue[900]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 15,
                              color: Colors.blue[900],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              (data["adult"].toString()),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue[900]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}
