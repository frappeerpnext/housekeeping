import 'package:flutter/material.dart';
import 'package:housekeeping/constants/constant.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: appColor.withOpacity(0.8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Housekeeping",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.yellow,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
