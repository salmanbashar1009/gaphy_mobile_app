import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{
  bool _isVisible = false;
  bool get isVisible => _isVisible;

void toggleVisibility() {
  _isVisible = !_isVisible;
  notifyListeners();
}

}