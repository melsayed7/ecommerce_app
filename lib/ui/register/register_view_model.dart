import 'package:ecommerce_app/ui/register/register_navigator.dart';
import 'package:flutter/material.dart';

import '../../api/api_manager.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterNavigator? navigator;

  void register(String email, String name, String password, String phone,
      String confirmPassword) async {
    navigator?.showLoading('Loading...');
    try {
      var response = await ApiManager.register(
        email,
        name,
        password,
        phone,
        confirmPassword,
      );
      navigator?.hideDialog();
      if (response.errors != null) {
        navigator?.showMessage(
          response.mergeErrors(),
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
