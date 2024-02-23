import 'package:get_it/get_it.dart';
import 'package:to_do_app/repository/auth_repo.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthRepo());
}