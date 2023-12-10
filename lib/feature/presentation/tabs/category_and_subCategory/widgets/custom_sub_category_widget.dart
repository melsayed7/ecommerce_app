import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubCategoryWidget extends StatelessWidget {
  CustomSubCategoryWidget({Key? key, required this.subCategoryEntity})
      : super(key: key);
  SubCategoryEntity subCategoryEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 100.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                image: AssetImage(MyImages.property2),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          subCategoryEntity.name ?? '',
          style: TextStyle(
            color: MyColor.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
