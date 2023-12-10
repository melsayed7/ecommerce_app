import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/category_and_subCategory/cubit/category_and_subCategory_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/category_and_subCategory/cubit/category_and_subCategory_state.dart';
import 'package:ecommerce_app/feature/presentation/tabs/category_and_subCategory/widgets/custom_category_widget.dart';
import 'package:ecommerce_app/feature/presentation/tabs/category_and_subCategory/widgets/custom_sub_category_widget.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/widgets/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryAndSubCategoryScreen extends StatelessWidget {
  CategoryAndSubCategoryScreen({Key? key}) : super(key: key);

  SubCategoriesCubit cubit = SubCategoriesCubit(
    getAllCategoriesUseCase: injectGetAllCategoriesUseCase(),
    getAllSubCategoriesOnCategoryUseCase:
        injectGetAllSubCategoriesOnCategoryUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      bloc: cubit..getAllCategories(),
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
          body: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Row(
              children: [
                state is CategoryLoadingState
                    ? Center(
                        child:
                            CircularProgressIndicator(color: MyColor.mainColor))
                    : Expanded(
                        flex: 2,
                        child: Container(
                          width: 137.w,
                          decoration: BoxDecoration(
                            color: MyColor.columBGColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: cubit.categoriesList.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 5,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        cubit.getAllSubCategories(
                                            cubit.categoriesList[index].id ??
                                                '');
                                        cubit.titleNameCategory =
                                            cubit.categoriesList[index].name ??
                                                '';
                                        cubit.changeTitleName(
                                            cubit.titleNameCategory);
                                        print(
                                            cubit.categoriesList[index].image ??
                                                '');
                                      },
                                      child: CustomCategoryWidget(
                                          categoryOrBrandEntity:
                                              cubit.categoriesList[index]),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  width: 24.w,
                ),
                state is SubCategoryLoadingState
                    ? Center(
                        child:
                            CircularProgressIndicator(color: MyColor.mainColor))
                    : Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.titleNameCategory,
                              style: TextStyle(
                                color: MyColor.textColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Image.asset(MyImages.poster),
                            SizedBox(
                              height: 20.h,
                            ),
                            Expanded(
                              child: GridView.builder(
                                itemCount: cubit.subCategoriesList.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 13,
                                  mainAxisSpacing: 13,
                                ),
                                itemBuilder: (context, index) {
                                  return CustomSubCategoryWidget(
                                      subCategoryEntity:
                                          cubit.subCategoriesList[index]);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
