// global viewmodel
import 'package:testapp/viewmodels/base/base_viewmodel.dart';

class TestAppViewModel extends BaseViewModel {
  String authToken;
  String username;
  String email;

  setAuthToken(String authToken) {
    this.authToken = authToken;
    notifyListeners();
  }

  clearAuthToken() {
    this.authToken = null;
    notifyListeners();
  }
}
