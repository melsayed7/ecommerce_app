import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandSection extends StatelessWidget {
  CategoryOrBrandSection({Key? key, required this.list}) : super(key: key);

  List<CategoryOrBrandEntity> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(categoryOrBrand: list[index]);
          }),
    );
  }
}

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandItem({Key? key, required this.categoryOrBrand})
      : super(key: key);
  CategoryOrBrandEntity categoryOrBrand;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: MyColor.whiteColor, width: 2),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(MyColor.mainColor),
                  ),
                ),
              ),
              imageUrl: categoryOrBrand.image ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoryOrBrand.name ?? '',
            textAlign: TextAlign.center,
            textWidthBasis: TextWidthBasis.longestLine,
            style: TextStyle(
              fontSize: 14.sp,
              color: MyColor.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
