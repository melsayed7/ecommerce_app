import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
      {required this.getProductsUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  List<ProductEntity> productList = [];
  int numOfCart = 0;

  static ProductCubit get(context) => BlocProvider.of(context);

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

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);

    either.fold(
      (failure) {
        emit(AddToCartErrorState(error: failure));
      },
      (response) {
        numOfCart = response.numOfCartItems?.toInt() ?? 0;
        print(numOfCart);
        emit(AddToCartSuccessState(addToCartResponseEntity: response));
      },
    );
  }
}
