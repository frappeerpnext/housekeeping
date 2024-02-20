import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:housekeeping/controllers/app_controller.dart';
import 'package:housekeeping/locator.dart';
import 'package:housekeeping/services/api_service.dart';
import 'package:housekeeping/services/app_service.dart';

class LoginController extends GetxController {
  var appCtr = Get.put(AppController());
  var appService = locator<IAppService>();

  var isLoading = false.obs;

  //storage init
  final storage = GetStorage();

  var serverUrlController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  var serverUrlInput = "".obs;
  var usernameInput = "".obs;
  var passwordInput = "".obs;

  get loading => null;
  @override
  Future<void> onInit() async {
    super.onInit();
    await _onInitState;
  }

  get _onInitState async {
    usernameInput("administrator"); //remove this line on pro
    passwordInput("123456"); //remove this line on pro

    usernameController.value.text = usernameInput.value;
    passwordController.value.text = passwordInput.value;

    if (storage.hasData("serverUrl")) {
      serverUrlInput(storage.read("serverUrl"));
      serverUrlController.value.text = serverUrlInput.value;
    }
  }

  //username changed value
  void onUsernameInputValueChange(String? value) => usernameInput(value);
  //password changed value
  void onPasswordInputValueChange(String? value) => passwordInput(value);
  //server url changed value
  void onServerUrlInputValueChange(String? value) => serverUrlInput(value);

  //method login system
  void onLoginPressed() async {
    if (isLoading.value) {
      return;
    }

    if (serverUrlInput.value.isEmpty) {
      //invalid server url
      Get.snackbar(
        'Housekeeping App',
        "Invalid server url!",
        colorText: Colors.white,
        backgroundColor: Colors.orange[300],
        icon: const Icon(
          Icons.add_alert,
          color: Colors.white,
        ),
      );
      return;
    }
    if (usernameInput.value.isEmpty) {
      //invalid username
      Get.snackbar(
        'Housekeeping App',
        "Invalid username!",
        colorText: Colors.white,
        backgroundColor: Colors.orange[300],
        icon: const Icon(
          Icons.add_alert,
          color: Colors.white,
        ),
      );
      return;
    }
    if (passwordInput.value.isEmpty) {
      Get.snackbar(
        'Housekeeping App',
        "Invalid password!",
        colorText: Colors.white,
        backgroundColor: Colors.orange[300],
        icon: const Icon(
          Icons.add_alert,
          color: Colors.white,
        ),
      );
      return;
    }
    if (!storage.hasData("serverUrl")) {
      storage.write("serverUrl", serverUrlInput.value);
    }

    var body_ = jsonEncode({
      "usr": usernameInput.value,
      "pwd": passwordInput.value,
    });
    isLoading.value = true;
    var resp =
        await Api.post(serverUrlInput.value, "/api/method/login", body: body_);
    if (resp.isSuccess) {
      if (resp.headers != null) {
        String? rawCookie = resp.headers!['set-cookie'];
        if (rawCookie != null) {
          int index = rawCookie.indexOf(';');
          var cookie =
              (index == -1) ? rawCookie : rawCookie.substring(0, index);
          storage.write("rawCookie", rawCookie);
          storage.write("headerCookie", cookie);

          var auth = await appService.appAuthorization();
          if (auth) {
            appCtr.onGetUserLogonCookie();
          }
          appCtr.isAuthorized(auth);

          isLoading.value = false;
        }
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
        'Housekeeping App',
        "Please input correct username and password!",
        colorText: Colors.white,
        backgroundColor: Colors.orange[300],
        icon: const Icon(
          Icons.add_alert,
          color: Colors.white,
        ),
      );
    }
  }

  void onLogoutPressed() async {
    var resp = await Api.get(serverUrlInput.value, "/api/method/logout");
    if (resp.isSuccess) {
      storage.remove("rawCookie");
      storage.remove("headerCookie");
      var auth = await appService.appAuthorization();
      appCtr.isAuthorized(auth);
    }
  }
}
