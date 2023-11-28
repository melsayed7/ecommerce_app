import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/repositories/repository/home_repository_contract.dart';

class GetAllBrandsUseCase {
  HomeRepositoryContract homeRepositoryContract;

  GetAllBrandsUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepositoryContract.getBrands();
  }
}
