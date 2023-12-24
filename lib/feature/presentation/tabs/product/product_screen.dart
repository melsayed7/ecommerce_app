import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_state.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/cart_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custum_product_item.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  ProductCubit cubit = ProductCubit(
    getProductsUseCase: injectGetProductsUseCase(),
    addToCartUseCase: injectAddToCartUseCase(),
    getCartUseCase: injectGetCartUseCase(),
    removeCartItemUseCase: injectRemoveCartItemUseCase(),
    updateCountCartItemUseCase: injectUpdateCountCartItemUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => cubit..getProduct(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(MyImages.smallLogo),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: MyColor.textColor,
                              ),
                            ),
                            prefixIcon: Image.asset(MyImages.search),
                            hintText: 'what do you search for?',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Badge(
                            label: Text(cubit.numOfCart.toString()),
                            child: Image.asset(MyImages.shopCart),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: state is ProductLoadingState
                ? Center(
                    child: CircularProgressIndicator(color: MyColor.mainColor))
                : GridView.builder(
                    itemCount: cubit.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.4,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            ProductDetails.routeName,
                            arguments: cubit.productList[index],
                          );
                        },
                        child: CustomProductItem(
                            productEntity: cubit.productList[index]),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
