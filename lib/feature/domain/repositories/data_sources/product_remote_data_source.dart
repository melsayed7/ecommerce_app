import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failures, ProductResponseEntity>> getProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
