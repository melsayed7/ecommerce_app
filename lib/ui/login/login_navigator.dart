import 'dart:ui';

abstract class LoginNavigator {
  void showLoading(String message);

  void hideDialog();

  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool dismissible = true});
}
