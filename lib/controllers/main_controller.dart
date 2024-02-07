import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/login_controller.dart';
import 'package:housekeeping/screens/home/home_screen.dart';
import 'package:housekeeping/screens/profile/profile_screen.dart';
import 'package:housekeeping/screens/room/room_screen.dart';
import 'package:housekeeping/screens/search/search_screen.dart';

class MainController extends GetxController {
  var loginCtr = Get.put(LoginController());
  var bottomNavigationBarIndexSelected = (0).obs;
  var bottomBarTitle = ["Home", "Room", "Search", "Profile"];
  var title = ("Home").obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await _onInitState;
  }

  get _onInitState async {
    onBottomNavigationBarPressed(0);
  }

  void onBottomNavigationBarPressed(int index) {
    title(bottomBarTitle[index]);
    bottomNavigationBarIndexSelected(index);
  }

  Widget? get getBodyWidget {
    switch (bottomNavigationBarIndexSelected.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const RoomScreen();
      case 2:
        return const SearchScreen();
      case 3:
        return const ProfileScreen();
    }
    return null;
  }
}
