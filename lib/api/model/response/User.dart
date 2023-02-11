/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutt@gmail.com"
/// phone : "01010700700"
/// password : "$2a$12$QWbQnT2BNnOT3rSFcCQnmeOwAR.3pmIcyq3BhpcfVc3z5Zu8l4KBG"
/// role : "user"
/// _id : "63d6aef1d59604a9a1baf555"
/// createdAt : "2023-01-29T17:37:53.117Z"
/// updatedAt : "2023-01-29T17:37:53.117Z"
/// __v : 0

class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.id,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
  }

  String? name;
  String? email;
  String? phone;
  String? password;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;

    return map;
  }
}
