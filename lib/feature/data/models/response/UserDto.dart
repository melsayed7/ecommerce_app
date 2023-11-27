import 'dart:convert';

import 'package:ecommerce_app/feature/domain/entities/UserEntity.dart';

/// name : "Ahmed Abd Al-Muti"
/// email : "route10@gmail.com"
/// role : "user"

UserDto userFromJson(String str) => UserDto.fromJson(json.decode(str));

String userToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  UserDto copyWith({
    String? name,
    String? email,
    String? role,
  }) =>
      UserDto(
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(
      email: email,
      name: name,
    );
  }
}
