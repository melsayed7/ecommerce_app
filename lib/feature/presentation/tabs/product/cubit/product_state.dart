import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {
  String? loadingMessage;

  ProductLoadingState({required this.loadingMessage});
}

class ProductErrorState extends ProductState {
  Failures error;

  ProductErrorState({required this.error});
}

class ProductSuccessState extends ProductState {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductState {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ProductState {
  Failures error;

  AddToCartErrorState({required this.error});
}

class AddToCartSuccessState extends ProductState {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}
