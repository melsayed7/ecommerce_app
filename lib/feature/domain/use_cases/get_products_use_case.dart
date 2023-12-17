import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/product_repositry_contract.dart';

class GetProductsUseCase {
  ProductRepositoryContract productRepositoryContract;

  GetProductsUseCase({required this.productRepositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productRepositoryContract.getProducts();
  }
}
