import 'package:ecommerce_app/core/shared_pref.dart';
import 'package:ecommerce_app/feature/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            SharedPref.removeData(key: 'token');
            Navigator.of(context).pushReplacementNamed(SplashScreen.routeName);
          },
          child: const Icon(Icons.logout)),
    );
  }
}
