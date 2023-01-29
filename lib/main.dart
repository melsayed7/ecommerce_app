import 'package:ecommerce_app/ui/login/login_screen.dart';
import 'package:ecommerce_app/ui/register/register_screen.dart';
import 'package:ecommerce_app/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
