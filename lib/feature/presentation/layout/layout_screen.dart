import 'package:ecommerce_app/core/style/my_color.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../category/category_screen.dart';
import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layout_Screen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (val) {
          currentIndex = val;
          setState(() {});
        },
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.category, title: 'Category'),
          FloatingNavbarItem(icon: Icons.favorite_border, title: 'Favorite'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
        backgroundColor: MyColor.textColor,
        borderRadius: 20,
        margin: const EdgeInsets.all(5),
        iconSize: 24,
        itemBorderRadius: 50,
      ),
    );
  }
}
