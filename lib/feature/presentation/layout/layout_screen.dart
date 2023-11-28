import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_app/feature/presentation/layout/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = 'layout_Screen';

  LayoutCubit cubit = LayoutCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: MyColor.mainColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.toChangeIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    foregroundColor: cubit.currentIndex == 0
                        ? MyColor.mainColor
                        : MyColor.whiteColor,
                    backgroundColor: cubit.currentIndex == 0
                        ? MyColor.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(const AssetImage(MyImages.homeIcon),
                        size: 30.sp),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    foregroundColor: cubit.currentIndex == 1
                        ? MyColor.mainColor
                        : MyColor.whiteColor,
                    backgroundColor: cubit.currentIndex == 1
                        ? MyColor.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(const AssetImage(MyImages.categoryIcon),
                        size: 30.sp),
                  ),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    foregroundColor: cubit.currentIndex == 2
                        ? MyColor.mainColor
                        : MyColor.whiteColor,
                    backgroundColor: cubit.currentIndex == 2
                        ? MyColor.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(const AssetImage(MyImages.favoriteIcon),
                        size: 30.sp),
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    foregroundColor: cubit.currentIndex == 3
                        ? MyColor.mainColor
                        : MyColor.whiteColor,
                    backgroundColor: cubit.currentIndex == 3
                        ? MyColor.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(const AssetImage(MyImages.profileIcon),
                        size: 30.sp),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
