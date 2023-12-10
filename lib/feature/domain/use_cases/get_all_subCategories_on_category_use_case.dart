import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/subCategories_repository_contract.dart';

class GetAllSubCategoriesOnCategoryUseCase {
  SubCategoriesRepositoryContract subCategoriesRepositoryContract;

  GetAllSubCategoriesOnCategoryUseCase(
      {required this.subCategoriesRepositoryContract});

  Future<Either<Failures, GetAllSubCategoriesOnCategoryResponseEntity>> invoke(
      String categoryID) {
    return subCategoriesRepositoryContract.getSubCategories(categoryID);
  }
}
