// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.message,
    this.user,
    this.accesstoken,
  });

  bool status;
  String message;
  List<LoginUser> user;
  String accesstoken;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    message: json["message"],
    user: List<LoginUser>.from(json["user"].map((x) => LoginUser.fromJson(x))),
    accesstoken: json["accesstoken"]==null?"haymanyoufailedtogetthetoken":json["accesstoken"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
    "accesstoken": accesstoken,
  };
}

class LoginUser {
  LoginUser({
    this.userId,
    this.firebaseId,
    this.name,
    this.cnic,
  });

  int userId;
  String firebaseId;
  String name;
  String cnic;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
    userId: json["UserId"],
    firebaseId: json["FirebaseId"],
    name: json["Name"],
    cnic: json["CNIC"],
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "FirebaseId": firebaseId,
    "Name": name,
    "CNIC": cnic,
  };
}
