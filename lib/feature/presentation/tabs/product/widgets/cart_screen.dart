import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/cart_item.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = 'cartScreen';

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          CartItem(),
          CartItem(),
          CartItem(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CustomProductText(
                    text: 'Total price',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: MyColor.textColor,
                  ),
                  CustomProductText(
                    text: 'EGP 2.00 ',
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
                      Icon(Icons.arrow_forward, color: MyColor.whiteColor),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
