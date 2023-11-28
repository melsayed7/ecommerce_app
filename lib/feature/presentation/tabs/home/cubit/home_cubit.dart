import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeCategoryInitialState());

  List<String> images = [
    MyImages.property1,
    MyImages.property2,
    MyImages.property3,
  ];

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories() async {
    emit(HomeCategoryLoadingState(loadMessage: 'Loading...'));
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(HomeCategoryErrorState(errorMessage: error));
      },
      (response) {
        categoriesList = response.data ?? [];
        emit(HomeCategorySuccessState(categoryResponseEntity: response));
      },
    );
  }

  void getAllBrands() async {
    emit(HomeBrandLoadingState(loadMessage: 'Loading...'));
    var either = await getAllCategoriesUseCase.invoke();
    // var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (error) {
        emit(HomeBrandErrorState(errorMessage: error));
      },
      (response) {
        brandsList = response.data ?? [];
        emit(HomeBrandSuccessState(brandResponseEntity: response));
      },
    );
  }
}
