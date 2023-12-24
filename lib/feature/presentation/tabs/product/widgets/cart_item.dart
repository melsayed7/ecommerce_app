import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  CartItem({Key? key, required this.productData}) : super(key: key);

  GetProductEntity productData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      height: 118.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: MyColor.columBGColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  productData.product?.imageCover ?? '',
                  height: 113.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 180.w,
                          child: CustomProductText(
                            text: productData.product?.title ?? '',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColor.textColor,
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            ProductCubit.get(context)
                                .removeCartItem(productData.product?.id ?? '');
                          },
                          child: Image.asset(MyImages.remove),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      width: 160.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: MyColor.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              int counter = productData.count ?? 0;
                              counter--;
                              ProductCubit.get(context).updateCountCartItem(
                                  productData.product?.id ?? '', counter);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MyColor.whiteColor,
                                  width: 1.5.w,
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: MyColor.whiteColor,
                                size: 15.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          CustomProductText(
                            text: '${productData.count ?? ' '}',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: MyColor.whiteColor,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              int counter = productData.count ?? 0;
                              counter++;
                              ProductCubit.get(context).updateCountCartItem(
                                  productData.product?.id ?? '', counter);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: MyColor.whiteColor, width: 1.5.w),
                              ),
                              child: Icon(
                                Icons.add,
                                color: MyColor.whiteColor,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomProductText(
                      text: 'EGP ${productData.price}',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
