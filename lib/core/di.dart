import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/home_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/auth_repository_imp.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/home_repository_impl.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/home_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/auth_repositry_contract.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/home_repository_contract.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/register_use_case.dart';

import '../feature/domain/use_cases/login_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

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

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImp(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
