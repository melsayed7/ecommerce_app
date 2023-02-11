/// value : "ahmedmutti@gmail.com"
/// msg : "Email already exists"
/// param : "email"
/// location : "body"

class ServerError {
  ServerError({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  ServerError.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }
}
