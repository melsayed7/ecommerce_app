import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/my_color.dart';
import 'package:ecommerce_app/feature/presentation/auth/login/cubit/login_cubit.dart';
import 'package:ecommerce_app/feature/presentation/auth/login/cubit/login_state.dart';
import 'package:ecommerce_app/feature/presentation/layout/layout_screen.dart';
import 'package:ecommerce_app/feature/presentation/utils/custom_elevated_button.dart';
import 'package:ecommerce_app/feature/presentation/utils/custom_text.dart';
import 'package:ecommerce_app/feature/presentation/utils/custom_text_form_field.dart';
import 'package:ecommerce_app/feature/presentation/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit viewModel = LoginCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is LoginErrorState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
            context,
            state.errorMessage!,
            posActionTitle: 'OK',
            posAction: () {},
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
            context,
            state.authResultEntity.userEntity?.name ?? '',
            posActionTitle: 'OK',
            posAction: () {},
          );
          // SharedPref.saveData(key: 'token', value: state.authResultEntity.token);
          // print(state.authResultEntity.token);
          Navigator.of(context).pushReplacementNamed(LayoutScreen.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColor.mainColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: viewModel.formKey,
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
                      controller: viewModel.emailController,
                      inputType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'PLZ your email address';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(viewModel.emailController.text);
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
                      icon: const Icon(Icons.password),
                      suffixBtn: IconButton(
                        icon: Icon(viewModel.showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          viewModel.toShowPassword();
                        },
                      ),
                      obscureText: viewModel.showPassword,
                      controller: viewModel.passwordController,
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
                        viewModel.login();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
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
        );
      },
    );
  }
}
