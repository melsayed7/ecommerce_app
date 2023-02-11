import 'dart:convert';

import 'package:ecommerce_app/api/model/request/LoginRequest.dart';
import 'package:ecommerce_app/api/model/request/RegisterRequest.dart';
import 'package:ecommerce_app/api/model/response/LoginResponse.dart';
import 'package:ecommerce_app/api/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static const String baseUrl = 'route-ecommerce.vercel.app';
  static const String register = 'api/v1/auth/signup';
  static const String login = 'api/v1/auth/signin';
}

class ApiManager {
  static Future<RegisterResponse> register(
    String email,
    String name,
    String password,
    String phone,
    String rePassword,
  ) async {
    var registerReqBody = RegisterRequest(
      email: email,
      name: name,
      password: password,
      phone: phone,
      repassword: rePassword,
    );
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.register);
    var response = await http.post(url, body: registerReqBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(
    String email,
    String password,
  ) async {
    var registerReqBody = LoginRequest(
      email: email,
      password: password,
    );
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.login);
    var response = await http.post(url, body: registerReqBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}
