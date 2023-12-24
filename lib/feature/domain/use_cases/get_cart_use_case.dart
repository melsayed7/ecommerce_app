import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/product_repositry_contract.dart';

class GetCartUseCase {
  ProductRepositoryContract productRepositoryContract;

  GetCartUseCase({required this.productRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return productRepositoryContract.getCart();
  }
}
