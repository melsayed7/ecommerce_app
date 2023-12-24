import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ApiManager apiManager;

  ProductRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await apiManager.addToCart(productId);
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await apiManager.getProducts();
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> removeCartItem(
      String productId) async {
    var either = await apiManager.removeCartItem(productId);
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountCartItem(
      String productId, int count) async {
    var either = await apiManager.updateCountCartItem(productId, count);
    return either.fold(
      (failure) {
        return Left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }
}
