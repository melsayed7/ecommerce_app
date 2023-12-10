import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/subCategories_remote_data_source.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/subCategories_repository_contract.dart';

class SubCategoriesRepositoryImpl implements SubCategoriesRepositoryContract {
  SubCategoriesRemoteDataSource subCategoriesRemoteDataSource;

  SubCategoriesRepositoryImpl({required this.subCategoriesRemoteDataSource});

  @override
  Future<Either<Failures, GetAllSubCategoriesOnCategoryResponseEntity>>
      getSubCategories(String categoryID) {
    return subCategoriesRemoteDataSource.getSubCategories(categoryID);
  }
}
