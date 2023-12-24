import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';

abstract class ProductRepositoryContract {
  Future<Either<Failures, ProductResponseEntity>> getProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> removeCartItem(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountCartItem(
      String productId, int count);
}
