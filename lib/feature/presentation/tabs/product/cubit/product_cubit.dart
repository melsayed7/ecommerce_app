import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.getProductsUseCase})
      : super(ProductInitialState());

  GetProductsUseCase getProductsUseCase;
  List<ProductEntity> productList = [];

  void getProduct() async {
    emit(ProductLoadingState(loadingMessage: 'Loading...'));
    var either = await getProductsUseCase.invoke();

    either.fold(
      (failure) {
        emit(ProductErrorState(error: failure));
      },
      (response) {
        productList = response.data ?? [];
        emit(ProductSuccessState(productResponseEntity: response));
      },
    );
  }
}
