import 'dart:ui';

abstract class RegisterNavigator {
  void showLoading(String message);

  void hideDialog();

  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool dismissible = true});
}
