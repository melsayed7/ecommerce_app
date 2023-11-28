import 'package:ecommerce_app/feature/presentation/auth/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/login_use_case.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(InitialState());
  LoginUseCase loginUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool showPassword = true;

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState(loadingMessage: 'Loading...'));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold(
        (error) {
          emit(LoginErrorState(errorMessage: error.errorMessage));
        },
        (response) {
          emit(LoginSuccessState(authResultEntity: response));
        },
      );
    }
  }

  void toShowPassword() {
    showPassword = !showPassword;
    emit(ShowPasswordState());
  }
}
