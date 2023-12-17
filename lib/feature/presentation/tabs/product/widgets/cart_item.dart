import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

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
              SizedBox(
                height: 113.h,
                width: 120.w,
                child: Image.asset('assets/images/testImg.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomProductText(
                            text: 'Nike Air Jordon',
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          width: 50.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(MyImages.remove),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22.w,
                    ),
                    Row(
                      children: [
                        CustomProductText(
                            text: 'EGP 3,500',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        SizedBox(
                          width: 24.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: MyColor.mainColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: MyColor.whiteColor, width: 3),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: MyColor.whiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              CustomProductText(
                                text: '1',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: MyColor.whiteColor,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: MyColor.whiteColor, width: 3),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: MyColor.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
