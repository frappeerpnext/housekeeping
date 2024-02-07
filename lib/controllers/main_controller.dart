import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/login_controller.dart';
import 'package:housekeeping/screens/home/home_screen.dart';
import 'package:housekeeping/screens/profile/profile_screen.dart';
import 'package:housekeeping/screens/room/room_screen.dart';
import 'package:housekeeping/screens/search/search_screen.dart';

class MainController extends GetxController {
  var loginCtr = Get.put(LoginController());
  var bottomNavigationBarIndexSelected = 0.obs;
  var title = "Home".obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await _onInitState;
  }

  get _onInitState async {
    //
  }

  void onBottomNavigationBarPressed(int index) {
    bottomNavigationBarIndexSelected(index);
  }

  Widget? get getBodyWidget {
    switch (bottomNavigationBarIndexSelected.value) {
      case 0:
        title("Home");
        return const HomeScreen();
      case 1:
        title("Room");
        return const RoomScreen();
      case 2:
        title("Search");
        return const SearchScreen();
      case 3:
        title("Profile");
        return const ProfileScreen();
    }
    return null;
  }
}
