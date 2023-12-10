import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures.dart';
import 'package:ecommerce_app/core/shared_pref.dart';
import 'package:ecommerce_app/feature/data/models/api/api_constant.dart';
import 'package:ecommerce_app/feature/data/models/request/LoginRequest.dart';
import 'package:ecommerce_app/feature/data/models/request/RegisterRequest.dart';
import 'package:ecommerce_app/feature/data/models/response/CategoryOrBrandsResponseDto.dart';
import 'package:ecommerce_app/feature/data/models/response/GetAllSubCategoriesOnCategoryResponseDto.dart';
import 'package:ecommerce_app/feature/data/models/response/LoginResponseDto.dart';
import 'package:ecommerce_app/feature/data/models/response/ProductResponseDto.dart';
import 'package:ecommerce_app/feature/data/models/response/RegisterResponseDto.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(
    String name,
    String phone,
    String email,
    String password,
    String rePassword,
  ) async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.register);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var registerReqBody = RegisterRequest(
          name: name,
          phone: phone,
          email: email,
          password: password,
          rePassword: rePassword);
      var response = await http.post(url, body: registerReqBody.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(registerResponse.user);
        return Right(registerResponse);
      } else {
        print(registerResponse.message);
        print(registerResponse.error?.msg);
        return Left(
          ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error?.msg!
                : registerResponse.message,
          ),
        );
      }
    } else {
      return Left(NetworkError(errorMessage: 'Please Check Your Network !!'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.login);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var loginReqBody = LoginRequest(
        email: email,
        password: password,
      );
      var response = await http.post(url, body: loginReqBody.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        SharedPref.saveData(key: 'token', value: loginResponse.token);
        print(loginResponse.user);
        return Right(loginResponse);
      } else {
        print(loginResponse.message);
        return Left(
          ServerError(
            errorMessage: loginResponse.message,
          ),
        );
      }
    } else {
      return Left(NetworkError(errorMessage: 'Please Check Your Network !!'));
    }
  }

  Future<Either<Failures, CategoryOrBrandsResponseDto>>
      getAllCategories() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.categories);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var categoryResponse =
          CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        print(categoryResponse.message);
        return Left(
          ServerError(
            errorMessage: categoryResponse.message,
          ),
        );
      }
    } else {
      return Left(NetworkError(errorMessage: 'Please Check Your Network !!'));
    }
  }

  Future<Either<Failures, CategoryOrBrandsResponseDto>> getAllBrands() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.brands);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var brandResponse =
          CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandResponse);
      } else {
        print(brandResponse.message);
        return Left(
          ServerError(
            errorMessage: brandResponse.message,
          ),
        );
      }
    } else {
      return Left(NetworkError(errorMessage: 'Please Check Your Network !!'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.products);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        print(productResponse.message);
        return Left(
          ServerError(
            errorMessage: productResponse.message,
          ),
        );
      }
    } else {
      return Left(NetworkError(errorMessage: 'Please Check Your Network !!'));
    }
  }

  Future<Either<Failures, GetAllSubCategoriesOnCategoryResponseDto>>
      getSubCategories(String categoryID) async {
    var url = Uri.https(ApiConstant.baseUrl,
        '${ApiConstant.categories}/$categoryID/subcategories');

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await http.get(url);
      var subCategoriesResponse =
          GetAllSubCategoriesOnCategoryResponseDto.fromJson(
              jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(subCategoriesResponse);
      } else {
        print(subCategoriesResponse.message);
        return Left(
          ServerError(
            errorMessage: subCategoriesResponse.message,
          ),
        );
      }
    } else {
      return Left(NetworkError(errorMessage: 'Please Check Your Network !!'));
    }
  }
}
