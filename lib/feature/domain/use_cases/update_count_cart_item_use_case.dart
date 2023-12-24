import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/product_repositry_contract.dart';

class UpdateCountCartItemUseCase {
  ProductRepositoryContract productRepositoryContract;

  UpdateCountCartItemUseCase({required this.productRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return productRepositoryContract.updateCountCartItem(productId, count);
  }
}
