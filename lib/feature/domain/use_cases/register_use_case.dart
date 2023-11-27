import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/auth_repositry_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepositoryContract.register(
        name, email, password, rePassword, phone);
  }
}
