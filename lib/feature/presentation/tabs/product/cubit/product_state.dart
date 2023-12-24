import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/feature/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
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

class GetCartLoadingState extends ProductState {
  String? loadingMessage;

  GetCartLoadingState({required this.loadingMessage});
}

class GetCartErrorState extends ProductState {
  Failures error;

  GetCartErrorState({required this.error});
}

class GetCartSuccessState extends ProductState {
  GetCartResponseEntity getCartResponseEntity;

  GetCartSuccessState({required this.getCartResponseEntity});
}

class RemoveCartItemLoadingState extends ProductState {
  String? loadingMessage;

  RemoveCartItemLoadingState({required this.loadingMessage});
}

class RemoveCartItemErrorState extends ProductState {
  Failures error;

  RemoveCartItemErrorState({required this.error});
}

class RemoveCartItemSuccessState extends ProductState {
  GetCartResponseEntity getCartResponseEntity;

  RemoveCartItemSuccessState({required this.getCartResponseEntity});
}

class UpdateCountCartItemLoadingState extends ProductState {
  String? loadingMessage;

  UpdateCountCartItemLoadingState({required this.loadingMessage});
}

class UpdateCountCartItemErrorState extends ProductState {
  Failures error;

  UpdateCountCartItemErrorState({required this.error});
}

class UpdateCountCartItemSuccessState extends ProductState {
  GetCartResponseEntity getCartResponseEntity;

  UpdateCountCartItemSuccessState({required this.getCartResponseEntity});
}