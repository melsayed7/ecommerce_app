import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  String? loadingMessage;

  LoginLoadingState({required this.loadingMessage});
}

class LoginSuccessState extends LoginState {
  AuthResultEntity authResultEntity;

  LoginSuccessState({required this.authResultEntity});
}

class LoginErrorState extends LoginState {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class ShowPasswordState extends LoginState {}