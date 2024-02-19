import 'dart:convert';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:housekeeping/controllers/app_controller.dart';
import 'package:housekeeping/services/api_service.dart';
import 'package:intl/intl.dart';

class ReservationListController extends GetxController { 
  var appCtr = Get.find<AppController>();

  final storage = GetStorage();
  var isLoading = true.obs;
  var calendarCtr = CalendarWeekController().obs;
  var result = <dynamic, dynamic>{}.obs;
  // ignore: prefer_typing_uninitialized_variables
  var currentSelectedDate;

  CarouselController carouselOptionController = CarouselController();
  var carouselOptionIndex = 1.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(milliseconds: 5));
    calendarCtr.value.jumpToDate(appCtr.currentWorkingDay);

    isLoading(true);
    currentSelectedDate = appCtr.currentWorkingDay;
    await onLoadReservationList(currentSelectedDate);
    isLoading(false);
  }

  Future<void> onLoadReservationList(date) async {
    String serverUrl = storage.read("serverUrl");
    String formattedDate = DateFormat("yyyy-MM-dd").format(date);

    String apiQuery =
        "/api/method/edoor.api.app.reservation_list?property=${appCtr.propertyName}&date=$formattedDate";

    var resp = await Api.getWithCookie(serverUrl, apiQuery);
    if (resp.isSuccess) {
      result(jsonDecode(resp.content)["message"]);
    }
    currentSelectedDate = date;
  }

  Future<void> onChangeDate(n) async {
    isLoading(true);
    calendarCtr.value.jumpToDate(currentSelectedDate.add(Duration(days: n)));

    await onLoadReservationList(currentSelectedDate.add(Duration(days: n)));

    isLoading(false);
  }
}
