import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/product_repositry_contract.dart';

class AddToCartUseCase {
  ProductRepositoryContract productRepositoryContract;

  AddToCartUseCase({required this.productRepositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return productRepositoryContract.addToCart(productId);
  }
}
