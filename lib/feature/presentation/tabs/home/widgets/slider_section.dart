import 'package:ecommerce_app/core/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderSection extends StatelessWidget {
  SliderSection({Key? key, required this.images}) : super(key: key);

  List<String> images;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: MyColor.textColor,
      indicatorBackgroundColor: MyColor.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: images
          .map((image) => Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  image,
                  width: 396.w,
                  height: 200.h,
                ),
              ))
          .toList(),
    );
  }
}
