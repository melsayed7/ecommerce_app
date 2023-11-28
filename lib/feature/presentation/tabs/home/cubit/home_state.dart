import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeState {}

class HomeCategoryInitialState extends HomeState {}

class HomeCategoryLoadingState extends HomeState {
  String? loadMessage;

  HomeCategoryLoadingState({required this.loadMessage});
}

class HomeCategoryErrorState extends HomeState {
  Failures errorMessage;

  HomeCategoryErrorState({required this.errorMessage});
}

class HomeCategorySuccessState extends HomeState {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  HomeCategorySuccessState({required this.categoryResponseEntity});
}

class HomeBrandInitialState extends HomeState {}

class HomeBrandLoadingState extends HomeState {
  String? loadMessage;

  HomeBrandLoadingState({required this.loadMessage});
}

class HomeBrandErrorState extends HomeState {
  Failures errorMessage;

  HomeBrandErrorState({required this.errorMessage});
}

class HomeBrandSuccessState extends HomeState {
  CategoryOrBrandResponseEntity brandResponseEntity;

  HomeBrandSuccessState({required this.brandResponseEntity});
}
