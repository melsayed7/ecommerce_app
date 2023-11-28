import 'package:ecommerce_app/core/my_color.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String btnText;
  VoidCallback onPressed;

  CustomElevatedButton({required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColor.whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          color: MyColor.textColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }
}
