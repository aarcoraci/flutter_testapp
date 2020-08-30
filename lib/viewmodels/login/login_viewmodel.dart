import 'package:testapp/locator/service_locator.dart';
import 'package:testapp/services/authentication_services.dart';
import 'package:testapp/viewmodels/base/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationService authenticationService =
      locator<AuthenticationService>();

  login(String userId) {
    return authenticationService.login(userId);
  }
}
