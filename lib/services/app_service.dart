import 'package:get_storage/get_storage.dart';
import 'package:housekeeping/services/api_service.dart';

abstract class IAppService {
  Future<bool> appAuthorization();
}

class AppService implements IAppService {
  final storage = GetStorage();
  @override
  Future<bool> appAuthorization() async {
    //check server url
    if (storage.hasData("serverUrl")) {
      String serverUrl = storage.read("serverUrl");
      //check raw cookie
      if (storage.hasData("rawCookie")) {
        String rawCookie = storage.read("rawCookie");
        if (rawCookie.isEmpty) {
          return _onRemoveHeaderCookie();
        } else {
          //set header cookie
          int index = rawCookie.indexOf(';');
          var cookie =
              (index == -1) ? rawCookie : rawCookie.substring(0, index);
          //set header cookie to storage
          storage.write("headerCookie", cookie);
          //set header cookie to variable

          //function check user authorized
          return await _onCheckAuthorized(serverUrl, cookie);
        }
      } else {
        return _onRemoveHeaderCookie();
      }
      //end check raw cookie
    } else {
      //remove raw cookie and cookie
      return _onRemoveRawCookie();
    }
  }

  //method on check user authorized
  Future<bool> _onCheckAuthorized(String serverUrl, String cookie) async {
    var resp = await Api.get(
      serverUrl,
      "/api/method/edoor.api.utils.ping",
      cookie: cookie,
    );
    return resp.isSuccess;
  }

//method remove header cookie
  bool _onRemoveHeaderCookie() {
    if (storage.hasData("headerCookie")) {
      storage.remove("headerCookie");
    }
    return false;
  }

//method remove raw cookie
  bool _onRemoveRawCookie() {
    if (storage.hasData("rawCookie")) {
      storage.remove("rawCookie");
    }
    return _onRemoveHeaderCookie();
  }
}
