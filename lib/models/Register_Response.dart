// To parse this JSON data, do
//
//     final login = registerFromJson(jsonString);

import 'dart:convert';

Login registerFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.message,
    this.userId,
  });

  bool status;
  String message;
  int userId;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    message: json["message"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "userId": userId,
  };
}
