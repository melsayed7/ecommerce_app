import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItem extends StatelessWidget {
  CustomProductItem({Key? key, required this.productEntity}) : super(key: key);

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      height: 237.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: MyColor.columBGColor,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              productEntity.imageCover ?? '',
              height: 128.h,
              width: 191.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 2.h),
          CustomProductText(
            text: productEntity.title ?? '',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: MyColor.textColor,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              CustomProductText(
                text: 'EGP ${productEntity.price ?? ''} ',
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color: MyColor.textColor,
              ),
              CustomProductText(
                text: '1,200 ',
                decoration: TextDecoration.lineThrough,
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color: MyColor.textColor,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              CustomProductText(
                text: 'Review (${productEntity.ratingsAverage ?? ''})',
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: MyColor.textColor,
              ),
              Image.asset(MyImages.star),
              const Spacer(flex: 1),
              InkWell(
                onTap: () {
                  ProductCubit.get(context).addToCart(productEntity.id ?? '');
                },
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.add_circle,
                  size: 32.sp,
                  color: MyColor.mainColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
