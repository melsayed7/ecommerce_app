import 'package:ecommerce_app/feature/data/models/response/Errors.dart';
import 'package:ecommerce_app/feature/domain/entities/auth_result_entity.dart';

import 'UserDto.dart';

class RegisterResponseDto {
  RegisterResponseDto({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
    this.error,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error;

  RegisterResponseDto copyWith({
    String? message,
    UserDto? user,
    String? token,
    Error? error,
  }) =>
      RegisterResponseDto(
        message: message ?? this.message,
        user: user ?? this.user,
        error: error ?? this.error,
        token: token ?? this.token,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    // if (error != null) {
    //   map['errors'] = error?.toJson();
    // }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity(),
    );
  }
}
