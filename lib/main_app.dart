import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/main_controller.dart';
import 'package:housekeeping/layouts/blank_layout.dart';
import 'package:housekeeping/layouts/main_layout.dart';
import 'package:housekeeping/screens/landing_screen.dart';
import 'package:housekeeping/screens/login_screen.dart';
import 'package:housekeeping/screens/main_screen.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());

    var content = Obx(
      () => controller.loginCtr.appCtr.isLoading.value
          ? const BlankLayout(
              body: LandingScreen(),
            )
          : controller.loginCtr.appCtr.isAuthorized.value
              ? const MainLayout(
                  body: MainScreen(),
                )
              : const BlankLayout(
                  body: LoginScreen(),
                ),
    );
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Housekeeping',
      // translations: Language(),
      // locale: controller.appCtrl.currentLanguage.value,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: KhmerFonts.siemreap,
        package: 'khmer_fonts',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 96, 175),
          titleSpacing: 10,
          toolbarHeight: 50,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: KhmerFonts.siemreap,
            package: 'khmer_fonts',
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintStyle: const TextStyle(fontSize: 14),
          labelStyle: const TextStyle(fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            // textStyle: const TextStyle(fontSize: 12),
            // side: BorderSide(width: 2, color: Colors.green),
          ),
        ),
      ),
      home: content,
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
