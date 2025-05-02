import 'package:flutter/cupertino.dart';
import 'package:gaphy_mobile_app/core/constant/urls.dart';
import 'package:gaphy_mobile_app/core/services/api_services.dart';
import 'package:gaphy_mobile_app/presentation/features/login/model/login_data_model.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoginInProgress = false;
  bool get isLoginInProgress => _isLoginInProgress;

  LoginDataModel _loginData = LoginDataModel();
  LoginDataModel get loginData => _loginData;

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  /// Toggles password visibility and notifies UI
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  /// Fetches login data from API and updates the state
  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    _isLoginInProgress = true;
    notifyListeners();

    final Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      final response = await ApiServices.postAPICall(Urls.login, requestBody);

      if (response.statusCode == 200) {
        // TODO: Properly map response.data into LoginDataModel
        // _loginData = response.data;
        debugPrint("Data Loaded Successfully: ${response.statusMessage}");
      } else {
        debugPrint("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Login request failed with error: $e");
    } finally {
      _isLoginInProgress = false;
      notifyListeners();
    }
  }
}
