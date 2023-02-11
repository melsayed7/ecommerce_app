import 'package:ecommerce_app/style/my_color.dart';
import 'package:ecommerce_app/ui/login/login_view_model.dart';
import 'package:ecommerce_app/ui/register/register_screen.dart';
import 'package:ecommerce_app/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/ui/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/ui/widgets/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_text.dart';
import 'login_navigator.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  LoginViewModel viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

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
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  Text(
                    'Welcome Back To Route',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: MyColor.whiteColor),
                  ),
                  Text(
                    'Please sign in with your mail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: MyColor.whiteColor),
                  ),
                  const SizedBox(
                    height: 40,
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
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot password',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: MyColor.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomElevatedButton(
                    btnText: 'Login',
                    onPressed: () {
                      login();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RegisterScreen.routeName);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: MyColor.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      viewModel.login(
        emailController.text,
        passwordController.text,
      );
    }
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
