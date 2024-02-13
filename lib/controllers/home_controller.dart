import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:housekeeping/services/api_service.dart';

class HomeController extends GetxController {
  final storage = GetStorage();
  var serverUrl = "".obs;
  var cookie = "".obs;
  var dashboardData = <dynamic, dynamic>{}.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _onInitState;
  }

  get _onInitState async {
    String serverUrl = storage.read("serverUrl");
    var resp = await Api.getWithCookie(
      serverUrl,
      "/api/method/edoor.api.frontdesk.get_dashboard_data?property=ESTC+HOTEL&date=2024-01-31",
    );

    dashboardData(jsonDecode(resp.content)["message"]);

    // ignore: avoid_print
    print(dashboardData);
  }

  Future<void> onRefresh() async {
    await _onInitState;
  }
  
}
