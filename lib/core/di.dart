import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/home_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/product_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/subCategories_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/auth_repository_imp.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/home_repository_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/product_repository_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/subCategories_repository_impl.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/home_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/subCategories_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/auth_repositry_contract.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/home_repository_contract.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/product_repositry_contract.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/subCategories_repository_contract.dart';
import 'package:ecommerce_app/feature/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/remove_cart_item_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/update_count_cart_item_use_case.dart';

import '../feature/domain/repositories/data_sources/product_remote_data_source.dart';
import '../feature/domain/use_cases/get_all_subCategories_on_category_use_case.dart';
import '../feature/domain/use_cases/login_use_case.dart';

/// login and register
RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImp(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

///  categories and products and brands

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(homeRemoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

/// product and add , get , remove cart

GetProductsUseCase injectGetProductsUseCase() {
  return GetProductsUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

RemoveCartItemUseCase injectRemoveCartItemUseCase() {
  return RemoveCartItemUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

UpdateCountCartItemUseCase injectUpdateCountCartItemUseCase() {
  return UpdateCountCartItemUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

ProductRepositoryContract injectProductRepositoryContract() {
  return ProductRepositoryImpl(
      productRemoteDataSource: injectProductRemoteDataSource());
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

/// subCategories

GetAllSubCategoriesOnCategoryUseCase
    injectGetAllSubCategoriesOnCategoryUseCase() {
  return GetAllSubCategoriesOnCategoryUseCase(
      subCategoriesRepositoryContract: injectSubCategoriesRepositoryContract());
}

SubCategoriesRepositoryContract injectSubCategoriesRepositoryContract() {
  return SubCategoriesRepositoryImpl(
      subCategoriesRemoteDataSource: injectSubCategoriesRemoteDataSource());
}

SubCategoriesRemoteDataSource injectSubCategoriesRemoteDataSource() {
  return SubCategoriesRemoteDataSourceImpl(
      apiManager: ApiManager.getInstance());
}
