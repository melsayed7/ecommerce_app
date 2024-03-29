import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/style/my_color.dart';
import 'package:ecommerce_app/feature/presentation/auth/register/cubit/register_cubit.dart';
import 'package:ecommerce_app/feature/presentation/auth/register/cubit/register_state.dart';
import 'package:ecommerce_app/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/feature/presentation/widgets/custom_text.dart';
import 'package:ecommerce_app/feature/presentation/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/feature/presentation/widgets/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit viewModel =
      RegisterCubit(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
            context,
            state.errorMessage!,
            posActionTitle: 'OK',
            posAction: () {},
          );
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
            context,
            'Success',
            posActionTitle: 'OK',
            posAction: () {},
          );
        }
      },
      child: Scaffold(
        backgroundColor: MyColor.mainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: viewModel.formKey,
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
                    controller: viewModel.nameController,
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
                    controller: viewModel.phoneController,
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
                    controller: viewModel.emailController,
                    inputType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'PLZ entre your email address';
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
                        setState(() {
                          viewModel.showPassword = !viewModel.showPassword;
                        });
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
                  CustomText(text: 'Confirm Password'),
                  CustomTextFormField(
                    hint: 'Entre your confirm password',
                    icon: const Icon(Icons.password),
                    suffixBtn: IconButton(
                      icon: Icon(viewModel.showPasswordConfirm
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          viewModel.showPasswordConfirm =
                              !viewModel.showPasswordConfirm;
                        });
                      },
                    ),
                    obscureText: viewModel.showPasswordConfirm,
                    controller: viewModel.confirmPasswordController,
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
                      viewModel.register();
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

}
