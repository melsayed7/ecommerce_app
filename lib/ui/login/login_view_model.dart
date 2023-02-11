import 'package:ecommerce_app/ui/login/login_navigator.dart';
import 'package:flutter/foundation.dart';

import '../../api/api_manager.dart';

class LoginViewModel extends ChangeNotifier {
  LoginNavigator? navigator;

  void login(String email, String password) async {
    navigator?.showLoading('Loading...');
    try {
      var response = await ApiManager.login(
        email,
        password,
      );
      navigator?.hideDialog();
      if (response.message != null) {
        navigator?.showMessage(
          response.message ?? '',
          posActionTitle: 'OK',
        );
        return;
      }

      navigator?.showMessage(
        response.token ?? '',
        posActionTitle: 'OK',
      );
    } catch (error) {
      navigator?.hideDialog();
      navigator?.showMessage('Errors $error');
    }
  }
}
