import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/home_repository_contract.dart';

class GetProductsUseCase {
  HomeRepositoryContract homeRepositoryContract;

  GetProductsUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepositoryContract.getProducts();
  }
}
