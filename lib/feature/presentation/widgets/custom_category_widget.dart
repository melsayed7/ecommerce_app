import 'package:ecommerce_app/core/style/my_color.dart';
import 'package:flutter/material.dart';

class CustomCategoryWidget extends StatelessWidget {
  String image;

  String text;

  CustomCategoryWidget({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          /*child:
          Image.network(
              "https://route-ecommerce.vercel.app//categories/$image"),*/
          radius: 80,
        ),
        Text(text,
            style: TextStyle(
              color: MyColor.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
