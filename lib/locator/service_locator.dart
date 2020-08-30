// This is our global ServiceLocator
import 'package:get_it/get_it.dart';
import 'package:testapp/services/authentication_services.dart';
import 'package:testapp/viewmodels/app/test_app_viewmodel.dart';
import 'package:testapp/viewmodels/login/login_viewmodel.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  // serivces
  locator.registerLazySingleton(() => AuthenticationService());

  //viewmodels
  locator.registerLazySingleton(() => TestAppViewModel());
  locator.registerFactory(() => LoginViewModel());
}
