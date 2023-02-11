import 'package:ecommerce_app/ui/register/register_navigator.dart';
import 'package:ecommerce_app/ui/register/register_view_model.dart';
import 'package:ecommerce_app/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/ui/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/ui/widgets/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_text.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterNavigator {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
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
                        return 'PLZ entre your email address';
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController.text);
                      if (!emailValid) {
                        return 'Please entre valid email like john@gmail.com';
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
                      }
                      if (passwordController.text != text) {
                        return 'password dose n\'t match';
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
                      register();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    viewModel.register(
      emailController.text,
      nameController.text,
      passwordController.text,
      phoneController.text,
      confirmPasswordController.text,
    );
  }

  @override
  void hideDialog() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showLoading(String message) {
    DialogUtils.showLoading(context, message);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool dismissible = true}) {
    DialogUtils.showMessage(context, message);
  }
}
