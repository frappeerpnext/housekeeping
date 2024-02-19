import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:housekeeping/controllers/app_controller.dart';
import 'package:housekeeping/services/api_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var appCtr = Get.find<AppController>();

  var dataLoadding = true.obs;
  final storage = GetStorage();
  var serverUrl = "".obs;
  var cookie = "".obs;
  var tabBarIndex = 1.obs; // 0 Last Week, 1 Today, 2 Tomorrow

  var todayDashboardData = <dynamic, dynamic>{}.obs;
  var isLoadTodayData = true.obs;

  var tomorrowDashboardData = <dynamic, dynamic>{}.obs;
  var isLoadTomorrowData = true.obs;

  var yesterdayDashboardData = <dynamic, dynamic>{}.obs;
  var isYesterdayData = true.obs;

  late TabController tabController;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() => {
          if (!tabController.indexIsChanging)
            {
              onTabBarPressed(tabController.index),
            }
        });
    tabController.index = tabBarIndex.value;
    await _onInitState;
  }

  get _onInitState async {
    dataLoadding(true);
    await onLoadDashboardData();
    dataLoadding(false);
  }

  Future<void> onLoadDashboardData() async {
    String serverUrl = storage.read("serverUrl");
    String apiQuery =
        "/api/method/edoor.api.frontdesk.get_dashboard_data_by_timespan?property=${appCtr.propertyName}&timespan=";
    var date = "today";
    if (tabBarIndex.value == 0) {
      date = "yesterday";
    } else if (tabBarIndex.value == 2) {
      date = "tomorrow";
    }

    apiQuery = "$apiQuery$date";
    // ignore: prefer_typing_uninitialized_variables
    var result_;
    if (yesterdayDashboardData.isEmpty && tabBarIndex.value == 0) {
      isYesterdayData(true);
      var resp = await Api.getWithCookie(
        serverUrl,
        apiQuery,
      );
      result_ = jsonDecode(resp.content)["message"];

      yesterdayDashboardData(result_);
      isYesterdayData(false);
    } else if (todayDashboardData.isEmpty && tabBarIndex.value == 1) {
      isLoadTodayData(true);
      var resp = await Api.getWithCookie(
        serverUrl,
        apiQuery,
      );
      result_ = jsonDecode(resp.content)["message"];
      todayDashboardData(result_);
      isLoadTodayData(false);
    } else if (tomorrowDashboardData.isEmpty && tabBarIndex.value == 2) {
      isLoadTomorrowData(true);
      var resp = await Api.getWithCookie(
        serverUrl,
        apiQuery,
      );
      result_ = jsonDecode(resp.content)["message"];
      tomorrowDashboardData(result_);
      isLoadTomorrowData(false);
    }
    appCtr.currentWorkingDay = DateTime.parse(result_["working_date"]);


    // switch (tabBarIndex.value) {
    //   case 0:
    //     dashboardData(yesterdayDashboardData);
    //     break;
    //   case 1:
    //     dashboardData(todayDashboardData);
    //     break;
    //   default:
    //     dashboardData(tomorrowDashboardData);
    //     break;
    // }
    // dashboardData.refresh();
  }

  Future<void> onRefresh() async {
    switch (tabBarIndex.value) {
      case 0:
        yesterdayDashboardData({});
        break;
      case 2:
        tomorrowDashboardData({});
        break;
      default:
        todayDashboardData({});
        break;
    }
    await onLoadDashboardData();
  }

  void onTabBarPressed(int index) async {
    tabBarIndex(index);
    tabController.index = tabBarIndex.value;
    await onLoadDashboardData();
  }
}
