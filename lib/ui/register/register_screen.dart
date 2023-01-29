import 'package:ecommerce_app/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'registerScreen';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/logo.png',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(text: 'Full Name'),
                CustomTextFormField(
                  hint: 'Entre your full name',
                  icon: const Icon(Icons.person),
                  controller: nameController,
                  inputType: TextInputType.name,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'PLZ entre your name';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomText(text: 'Mobile Number'),
                CustomTextFormField(
                  hint: 'Entre your mobile number',
                  icon: const Icon(Icons.phone),
                  controller: phoneController,
                  inputType: TextInputType.number,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'PLZ entre your mobile number';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomText(text: 'Email Address'),
                CustomTextFormField(
                  hint: 'Entre your email address',
                  icon: const Icon(Icons.email_outlined),
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'PLZ your email address';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomText(text: 'Password'),
                CustomTextFormField(
                  hint: 'Entre your password',
                  icon: const Icon(Icons.remove_red_eye),
                  obscureText: true,
                  controller: passwordController,
                  inputType: TextInputType.text,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'PLZ entre your password';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomText(text: 'Confirm Password'),
                CustomTextFormField(
                  hint: 'Entre your confirm password',
                  icon: const Icon(Icons.remove_red_eye),
                  obscureText: true,
                  controller: confirmPasswordController,
                  inputType: TextInputType.text,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'PLZ confirm your password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  btnText: 'Register',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
