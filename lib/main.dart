import 'package:ecommerce_app/bloc_observer.dart';
import 'package:ecommerce_app/core/my_theme.dart';
import 'package:ecommerce_app/core/shared_pref.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/home_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/cart_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/presentation/auth/login/login_screen.dart';
import 'feature/presentation/auth/register/register_screen.dart';
import 'feature/presentation/layout/layout_screen.dart';
import 'feature/presentation/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPref.init();
  var user = SharedPref.getData(key: 'token');
  String routeName;
  if (user == null) {
    routeName = SplashScreen.routeName;
  } else {
    routeName = LayoutScreen.routeName;
  }
  runApp(MyApp(routeName));
}

class MyApp extends StatelessWidget {
  String routeName;

  MyApp(this.routeName, {super.key});

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
            ProductDetails.routeName: (_) => const ProductDetails(),
            CartScreen.routeName: (_) => const CartScreen(),
          },
          initialRoute: routeName,
        );
      },
    );
  }
}

// void initSharedPref() async {
//   await SharedPref.init();
//   var user = SharedPref.getData(key: 'token');
//   String routeName ;
//   if(user == null){
//     routeName = LoginScreen.routeName;
//   }else{
//     routeName = LayoutScreen.routeName;
//   }
// }
