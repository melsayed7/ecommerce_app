import 'package:ecommerce_app/core/my_theme.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/presentation/auth/login/login_screen.dart';
import 'feature/presentation/auth/register/register_screen.dart';
import 'feature/presentation/layout/layout_screen.dart';
import 'feature/presentation/splash_screen/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightTheme,
          routes: {
            SplashScreen.routeName: (_) => SplashScreen(),
            RegisterScreen.routeName: (_) => RegisterScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            LayoutScreen.routeName: (_) => LayoutScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
          },
          initialRoute: LayoutScreen.routeName,
        );
      },
    );
  }
}

void initSharedPref() async {
  var prefs = await SharedPreferences.getInstance();
  var userToken = prefs.getString('token');
  //userProvider.updateToken(userToken!);
  print("userToken = $userToken");
}
