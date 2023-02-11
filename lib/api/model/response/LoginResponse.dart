/// status : "error"
/// message : "Incorrect email or password"
/// token : ""

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  String? status;
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
