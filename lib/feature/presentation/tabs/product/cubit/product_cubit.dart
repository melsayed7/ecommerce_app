import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/remove_cart_item_use_case.dart';
import 'package:ecommerce_app/feature/domain/use_cases/update_count_cart_item_use_case.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required this.getProductsUseCase,
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.removeCartItemUseCase,
    required this.updateCountCartItemUseCase,
  }) : super(ProductInitialState());

  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  RemoveCartItemUseCase removeCartItemUseCase;
  UpdateCountCartItemUseCase updateCountCartItemUseCase;

  List<ProductEntity> productList = [];
  int numOfCart = 0;
  List<GetProductEntity> getProductList = [];

  static ProductCubit get(context) => BlocProvider.of(context);

  void getProduct() async {
    //emit(ProductLoadingState(loadingMessage: 'Loading...'));
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

  void getCart() async {
    emit(GetCartLoadingState(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();

    either.fold(
      (failure) {
        emit(GetCartErrorState(error: failure));
      },
      (response) {
        getProductList = response.data?.products ?? [];
        emit(GetCartSuccessState(getCartResponseEntity: response));
      },
    );
  }

  void removeCartItem(String productId) async {
    emit(RemoveCartItemLoadingState(loadingMessage: 'Loading...'));
    var either = await removeCartItemUseCase.invoke(productId);

    either.fold(
      (failure) {
        emit(RemoveCartItemErrorState(error: failure));
      },
      (response) {
        emit(GetCartSuccessState(getCartResponseEntity: response));
      },
    );
  }

  void updateCountCartItem(String productId, int count) async {
    emit(UpdateCountCartItemLoadingState(loadingMessage: 'Loading...'));
    var either = await updateCountCartItemUseCase.invoke(productId, count);

    either.fold(
      (failure) {
        emit(UpdateCountCartItemErrorState(error: failure));
      },
      (response) {
        emit(GetCartSuccessState(getCartResponseEntity: response));
      },
    );
  }
}
