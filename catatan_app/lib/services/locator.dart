
import 'package:catatan_app/services/api_services.dart';
import 'package:catatan_app/services/dialog_services.dart';
import 'package:catatan_app/services/entry_services.dart';
import 'package:catatan_app/services/user_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerLazySingleton(() => EntryService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => DialogService());
}