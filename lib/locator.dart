import 'package:get_it/get_it.dart';
import 'package:housekeeping/services/app_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<IAppService>(() => AppService());
}
