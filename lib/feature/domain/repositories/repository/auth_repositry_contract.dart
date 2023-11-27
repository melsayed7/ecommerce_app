import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, AuthResultEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );

  Future<Either<Failures, AuthResultEntity>> login(
    String email,
    String password,
  );
}
