import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/subCategories_remote_data_source.dart';

class SubCategoriesRemoteDataSourceImpl
    implements SubCategoriesRemoteDataSource {
  ApiManager apiManager;

  SubCategoriesRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetAllSubCategoriesOnCategoryResponseEntity>>
      getSubCategories(String categoryID) async {
    var either = await apiManager.getSubCategories(categoryID);
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
