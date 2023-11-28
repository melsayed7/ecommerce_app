import 'package:ecommerce_app/feature/presentation/layout/cubit/layout_state.dart';
import 'package:ecommerce_app/feature/presentation/tabs/category/category_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/favourite/favourite_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/home_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  void toChangeIndex(int newIndex) {
    LayoutInitialState();
    currentIndex = newIndex;
    emit(ChangeIndexState());
  }
}
