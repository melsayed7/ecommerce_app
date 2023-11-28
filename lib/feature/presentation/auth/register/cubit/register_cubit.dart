import 'package:ecommerce_app/feature/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/feature/presentation/auth/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(InitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool showPasswordConfirm = true;

  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
      var either = await registerUseCase.invoke(
        nameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
      );
      either.fold(
        (error) {
          emit(RegisterErrorState(errorMessage: error.errorMessage));
        },
        (response) {
          emit(RegisterSuccessState(authResultEntity: response));
        },
      );
    }
  }

  void toShowPassword() {
    showPassword = !showPassword;
    emit(ShowPasswordState());
  }

  void toShowPasswordConfirm() {
    showPasswordConfirm = !showPasswordConfirm;
    emit(ShowPasswordConfirmState());
  }
}
