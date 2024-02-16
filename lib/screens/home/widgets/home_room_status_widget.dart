import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housekeeping/constants/constant.dart';

class HomeRoomStatusWidget extends StatelessWidget {
  final Map<dynamic, dynamic> dashboardData;
  const HomeRoomStatusWidget({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                'Room Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...(dashboardData['housekeeping_status']).map(
                    (e) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.string(
                                  e['icon'],
                                  width: 30,
                                ),
                                const SizedBox(width: 25),
                                Text(
                                  e['status'] ?? "",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: HexColor.fromHex(e["color"]),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  (e['total'] ?? 0).toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
