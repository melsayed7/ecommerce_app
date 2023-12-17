import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/product_repositry_contract.dart';

class ProductRepositoryImpl implements ProductRepositoryContract {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) {
    return productRemoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return productRemoteDataSource.getProducts();
  }
}
