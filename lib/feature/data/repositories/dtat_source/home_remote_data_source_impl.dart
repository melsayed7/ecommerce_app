import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/data/models/api/api_manager.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/data_sources/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getCategories() async {
    var either = await apiManager.getAllCategories();
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
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() async {
    var either = await apiManager.getAllBrands();
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
