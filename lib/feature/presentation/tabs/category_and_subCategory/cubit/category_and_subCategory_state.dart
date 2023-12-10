import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';

abstract class SubCategoriesState {}

class CategoryAndSubCategoryInitialState extends SubCategoriesState {}

class CategoryLoadingState extends SubCategoriesState {
  String? loadMessage;

  CategoryLoadingState({required this.loadMessage});
}

class CategoryErrorState extends SubCategoriesState {
  Failures errorMessage;

  CategoryErrorState({required this.errorMessage});
}

class CategorySuccessState extends SubCategoriesState {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  CategorySuccessState({required this.categoryResponseEntity});
}

class SubCategoryLoadingState extends SubCategoriesState {
  String? loadMessage;

  SubCategoryLoadingState({required this.loadMessage});
}

class SubCategoryErrorState extends SubCategoriesState {
  Failures errorMessage;

  SubCategoryErrorState({required this.errorMessage});
}

class SubCategorySuccessState extends SubCategoriesState {
  GetAllSubCategoriesOnCategoryResponseEntity
      getAllSubCategoriesOnCategoryResponseEntity;

  SubCategorySuccessState(
      {required this.getAllSubCategoriesOnCategoryResponseEntity});
}

class ChangeTitleName extends SubCategoriesState {}
