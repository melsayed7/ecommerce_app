import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/widgets/search_section.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_state.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custum_product_item.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  ProductCubit cubit =
      ProductCubit(getProductsUseCase: injectGetProductsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: cubit..getProduct(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(MyImages.smallLogo),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchSection(),
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
    );
  }
}
