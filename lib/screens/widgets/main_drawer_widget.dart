import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/main_controller.dart';
import 'package:housekeeping/screens/widgets/powered_by_widget.dart';
import 'package:housekeeping/widgets/list_title/list_title_widget.dart';
import 'package:housekeeping/widgets/text/text_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    // print(controller.loginCtr.appCtr.userLogon["user_id"]);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.blue[800]!,
            ),
            accountName: TextWidget(
              // text: "${controller.loginCtr.appCtr.userLogon["full_name"]}",
              text: controller.loginCtr.usernameInput.value,
            ),
            accountEmail: const Text(" "),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: Image.network(
                "${controller.loginCtr.appCtr.userLogon["user_image"]}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              controller: ScrollController(initialScrollOffset: 0),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              children: [
                ListTileWidget(
                  icon: Icons.home,
                  text: "Home",
                  selected: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ListTileWidget(
                  text: "Logout",
                  icon: Icons.logout,
                  onPressed: () {
                    Navigator.pop(context);
                    controller.loginCtr.onLogoutPressed();
                  },
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
            child: const PoweredByWidget(),
          ),
        ],
      ),
    );
  }
}
