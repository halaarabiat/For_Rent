import 'dart:convert';

UserModel registerModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String registerModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  String? userid;
  String? username;
  String? fullname;
  String? email;
  String? password;

  UserModel({
    this.userid,
    this.username,
    this.fullname,
    this.email,
    this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    userid: json["userid"],
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "userid": userid,
    "username": username,
    "fullname": fullname,
    "email": email,
    // "password": password,
  };
}
