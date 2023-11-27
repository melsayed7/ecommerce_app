import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthResultEntity>> register(
    String name,
    String phone,
    String email,
    String password,
    String rePassword,
  ) async {
    var either =
        await apiManager.register(name, phone, email, password, rePassword);
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response.toAuthResultEntity());
      },
    );
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response.toAuthResultEntity());
      },
    );
  }
}
