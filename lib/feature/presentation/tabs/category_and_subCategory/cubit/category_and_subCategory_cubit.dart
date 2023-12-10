import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_subCategories_on_category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_and_subCategory_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllSubCategoriesOnCategoryUseCase})
      : super(CategoryAndSubCategoryInitialState());

  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllSubCategoriesOnCategoryUseCase getAllSubCategoriesOnCategoryUseCase;

  List<CategoryOrBrandEntity> categoriesList = [];
  List<SubCategoryEntity> subCategoriesList = [];
  String titleNameCategory = 'Music';

  void changeTitleName(String newTitleName) {
    titleNameCategory = newTitleName;
    emit(ChangeTitleName());
  }

  void getAllCategories() async {
    emit(CategoryLoadingState(loadMessage: 'Loading...'));
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(CategoryErrorState(errorMessage: error));
      },
      (response) {
        categoriesList = response.data ?? [];
        emit(CategorySuccessState(categoryResponseEntity: response));
      },
    );
  }

  void getAllSubCategories(String categoryID) async {
    emit(SubCategoryLoadingState(loadMessage: 'Loading...'));
    var either = await getAllSubCategoriesOnCategoryUseCase.invoke(categoryID);
    either.fold(
      (error) {
        emit(SubCategoryErrorState(errorMessage: error));
      },
      (response) {
        subCategoriesList = response.data ?? [];
        emit(SubCategorySuccessState(
            getAllSubCategoriesOnCategoryResponseEntity: response));
      },
    );
  }
}
