import 'package:ecommerce_app/feature/domain/entities/UserEntity.dart';

class AuthResultEntity {
  UserEntity? userEntity;

  String? token;

  AuthResultEntity({this.userEntity, this.token});
}
