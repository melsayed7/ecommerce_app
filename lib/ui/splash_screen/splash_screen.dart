import 'dart:async';

import 'package:ecommerce_app/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
      },
    );
    return Image.asset(
      'assets/images/splash_screen.png',
      fit: BoxFit.fill,
    );
  }
}
