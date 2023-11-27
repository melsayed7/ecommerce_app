import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/auth_repositry_contract.dart';

class AuthRepositoryImp implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(
    String name,
    String phone,
    String email,
    String password,
    String rePassword,
  ) {
    return remoteDataSource.register(name, phone, email, password, rePassword);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
