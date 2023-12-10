import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';

abstract class SubCategoriesRemoteDataSource {
  Future<Either<Failures, GetAllSubCategoriesOnCategoryResponseEntity>>
      getSubCategories(String categoryID);
}
