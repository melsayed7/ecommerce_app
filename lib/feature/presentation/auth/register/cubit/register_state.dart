import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';

abstract class RegisterState {}

class InitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  String? loadingMessage;

  RegisterLoadingState({required this.loadingMessage});
}

class RegisterSuccessState extends RegisterState {
  AuthResultEntity authResultEntity;

  RegisterSuccessState({required this.authResultEntity});
}

class RegisterErrorState extends RegisterState {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}
