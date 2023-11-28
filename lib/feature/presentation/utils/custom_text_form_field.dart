import 'package:ecommerce_app/core/my_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hint;

  TextEditingController controller;

  TextInputType inputType;

  String? Function(String?)? validator;

  bool obscureText;

  Icon icon;

  IconButton? suffixBtn;

  CustomTextFormField({
    required this.hint,
    required this.icon,
    required this.inputType,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    this.suffixBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, bottom: 25),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: icon,
            suffixIcon: suffixBtn,
            hintText: hint,
            filled: true,
            fillColor: MyColor.whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
