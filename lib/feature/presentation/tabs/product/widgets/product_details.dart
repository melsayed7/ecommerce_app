import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/cart_screen.dart';
import 'package:ecommerce_app/feature/presentation/tabs/product/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static const String routeName = 'productDetails';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as ProductEntity;
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
          text: 'Product Details',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      width: 2,
                      color: MyColor.columBGColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: MyColor.textColor,
                      indicatorBackgroundColor: MyColor.whiteColor,
                      indicatorBottomPadding: 20.h,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: arg.images!
                          .map((image) => Image.network(
                                image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Positioned(
                  right: 16.w,
                  top: 16.h,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                        backgroundColor: MyColor.whiteColor,
                        child: Image.asset(
                          MyImages.favoriteIcon,
                          color: MyColor.mainColor,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomProductText(
              text: arg.title ?? '',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: MyColor.textColor,
            ),
            CustomProductText(
              text: 'EGP ${arg.price}',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: MyColor.textColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: MyColor.columBGColor,
                            width: 2,
                          ),
                        ),
                        child: CustomProductText(
                          text: '${arg.sold} Sold',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: MyColor.textColor,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Image.asset(MyImages.star),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomProductText(
                        text: arg.ratingsAverage.toString(),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: MyColor.textColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            border:
                                Border.all(color: MyColor.whiteColor, width: 3),
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
                            border:
                                Border.all(color: MyColor.whiteColor, width: 3),
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
            SizedBox(
              height: 16.h,
            ),
            CustomProductText(
              text: 'Description',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: MyColor.textColor,
            ),
            SizedBox(
              height: 8.h,
            ),
            ReadMoreText(
              arg.description ?? '',
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: MyColor.descriptionColor,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
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
                      text: 'EGP ${arg.price} ',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColor.textColor,
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.mainColor,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 25.w)),
                    child: Row(
                      children: [
                        Icon(Icons.production_quantity_limits_sharp,
                            color: MyColor.whiteColor),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomProductText(
                          text: 'Add to cart',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: MyColor.whiteColor,
                        ),
                      ],
                    )),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
