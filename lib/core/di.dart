import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/data/repositories/dtat_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/data/repositories/repository/auth_repository_imp.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/auth_repositry_contract.dart';
import 'package:ecommerce_app/feature/domain/use_cases/register_use_case.dart';

import '../feature/domain/use_cases/login_use_case.dart';

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
