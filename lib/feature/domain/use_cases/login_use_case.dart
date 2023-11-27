import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/auth_repositry_contract.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;

  LoginUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(
    String email,
    String password,
  ) {
    return authRepositoryContract.login(email, password);
  }
}
