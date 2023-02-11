import 'package:ecommerce_app/api/model/response/ServerErrors.dart';

import 'User.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutt@gmail.com","phone":"01010700700","password":"$2a$12$QWbQnT2BNnOT3rSFcCQnmeOwAR.3pmIcyq3BhpcfVc3z5Zu8l4KBG","role":"user","_id":"63d6aef1d59604a9a1baf555","createdAt":"2023-01-29T17:37:53.117Z","updatedAt":"2023-01-29T17:37:53.117Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDZhZWYxZDU5NjA0YTlhMWJhZjU1NSIsImlhdCI6MTY3NTAxMzg3MywiZXhwIjoxNjgyNzg5ODczfQ.fsSYqU5G5vWsW1AbksD_MjjsVQXF6maOf6lOFJCNr_M"

class RegisterResponse {
  User? user;
  String? token;
  List<ServerError>? errors;

  RegisterResponse({
    this.user,
    this.token,
    this.errors,
  });

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    map['token'] = token;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  String mergeErrors() {
    String message = '';
    errors?.forEach((error) {
      message += '${error.msg ?? ' '}\n';
    });
    return message;
  }
}
