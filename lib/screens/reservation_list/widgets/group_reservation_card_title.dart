import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupReservationCardTitle extends StatelessWidget {
  final String title;
  final int total;
  const GroupReservationCardTitle(
      {super.key, required this.title, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(total.toString())),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
