import 'package:flutter/material.dart';

class PoweredByWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const PoweredByWidget({
    Key? key,
    this.margin = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Powered By: ",
            style: TextStyle(fontSize: 11),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Housekeeping",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
