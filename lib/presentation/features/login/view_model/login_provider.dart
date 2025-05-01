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

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  /// method that fetch login data
  Future<void> getLoginData(
      {required String email, required String password}) async {
    _isLoginInProgress = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {"email": email, "password": password};

    try {
      final response = await ApiServices.postAPICall(Urls.login, requestBody);
      if (response.statusCode == 200) {
        _loginData = response.data;
        debugPrint("Data Loaded Successfully: $_loginData");
        _isLoginInProgress = false;
        notifyListeners();
      } else {
        debugPrint("Data fetched failed");
        _isLoginInProgress = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("error: $e");
    }
  }
}
