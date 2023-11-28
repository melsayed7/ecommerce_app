import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands();
}