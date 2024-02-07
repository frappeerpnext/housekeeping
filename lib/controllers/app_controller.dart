import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:housekeeping/locator.dart';
import 'package:housekeeping/services/app_service.dart';

class AppController extends GetxController {
  final storage = GetStorage();
  var userLogon = <String, String>{};
  var appService = locator<IAppService>();
  var serverUrl = "http://192.168.10.19:1216".obs;

  var isAuthorized = false.obs;
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _onInitState;
  }

  get _onInitState async {
    //develop
    storage.write(
        "serverUrl", serverUrl.value); // delete this line when production

    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    var auth = await appService.appAuthorization();
    if (auth) {
      onGetUserLogonCookie();
    }
    isAuthorized(auth);
    isLoading(false);
  }

  void onGetUserLogonCookie() {
    String rawCookie = storage.read("rawCookie");
    try {
      var arrRawCookie = rawCookie.split(';');
      var sid = arrRawCookie[0].split('=');

      var expires = arrRawCookie[1].split('=');
      var sameSiteSystemUse = arrRawCookie[4].split(',');
      var sameSiteFullName = arrRawCookie[6].split(',');
      var sameSiteUserId = arrRawCookie[8].split(',');
      var sameSiteUserImage = arrRawCookie[10].split(',');

      var systemUser = sameSiteSystemUse[1].split('=');
      var fullName = sameSiteFullName[1].split('=');
      var userId = sameSiteUserId[1].split('=');
      var userImage = sameSiteUserImage[1].split('=');

      userLogon.addAll({sid[0].replaceAll(" ", ""): sid[1]});
      userLogon.addAll({expires[0].replaceAll(" ", ""): expires[1]});
      userLogon.addAll({systemUser[0].replaceAll(" ", ""): systemUser[1]});
      userLogon.addAll({fullName[0].replaceAll(" ", ""): fullName[1]});
      userLogon.addAll({userId[0].replaceAll(" ", ""): userId[1]});
      userLogon.addAll({
        userImage[0].replaceAll(" ", ""):
            "${storage.read("serverUrl")}${userImage[1]}"
      });
    } on Exception catch (_) {
      //
    }
  }
}
