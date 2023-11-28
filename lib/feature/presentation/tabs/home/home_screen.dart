import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/cubit/home_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/cubit/home_state.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/widgets/search_section.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/widgets/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/category_section.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  HomeCubit cubit = HomeCubit(
      getAllCategoriesUseCase: injectGetAllCategoriesUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(MyImages.smallLogo),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchSection(),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SliderSection(images: cubit.images),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: MyColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(
                          color: MyColor.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  state is HomeCategoryLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                              color: MyColor.mainColor))
                      : CategoryOrBrandSection(list: cubit.categoriesList),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Brands',
                        style: TextStyle(
                            color: MyColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(
                          color: MyColor.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  /// in this section when api of brands is working then go to home cubit and remove // from getAllBrandsUseCase
                  state is HomeBrandLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                              color: MyColor.mainColor))
                      : CategoryOrBrandSection(list: cubit.brandsList),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
