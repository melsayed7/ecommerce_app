import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_state.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/cart_item.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  static const String routeName = 'cartScreen';

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
      create: (context) => cubit..getCart(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: MyColor.blueColor,
                  size: 30.sp,
                ),
              ),
              title: CustomProductText(
                text: 'Cart',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: MyColor.textColor,
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    MyImages.search,
                    color: MyColor.blueColor,
                  ),
                ),
                SizedBox(
                  width: 32.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    MyImages.shopCart,
                    color: MyColor.blueColor,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
            body: state is GetCartSuccessState
                ? Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: ListView.builder(
                          itemCount: state.getCartResponseEntity.numOfCartItems,
                          // ProductCubit.get(context).getProductList.length,
                          itemBuilder: (context, index) {
                            return CartItem(
                                // productData: ProductCubit.get(context).getProductList[index]);
                                productData: state.getCartResponseEntity.data!
                                    .products![index]);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomProductText(
                                  text: 'Total price',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: MyColor.textColor,
                                ),
                                CustomProductText(
                                  text:
                                      'EGP ${state.getCartResponseEntity.data?.totalCartPrice ?? ''} ',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: MyColor.textColor,
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColor.mainColor,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 35.w)),
                                child: Row(
                                  children: [
                                    CustomProductText(
                                      text: 'Check Out',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: MyColor.whiteColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: MyColor.whiteColor),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(color: MyColor.mainColor),
                  ),
          );
        },
      ),
    );
  }
}
