import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  CustomCategoryWidget({Key? key, required this.categoryOrBrandEntity})
      : super(key: key);

  CategoryOrBrandEntity categoryOrBrandEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          height: 72.h,
          width: 7.w,
          decoration: BoxDecoration(
              color: MyColor.mainColor,
              borderRadius: BorderRadius.circular(20.r)),
        ),
        Flexible(
          flex: 1,
          child: Text(
            categoryOrBrandEntity.name ?? '',
            style: TextStyle(
              color: MyColor.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
