import 'dart:convert';

import 'package:rent/models/post_model.dart';

UserModel registerModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String registerModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  String? userid;
  String? username;
  String? fullname;
  String? email;
  String? password;
  PostFormModel? postForm;

  UserModel({
    this.userid,
    this.username,
    this.fullname,
    this.email,
    this.password,
    this.postForm,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    userid: json["userid"],
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    password: json["password"],
    postForm: json["postForm"] != null
        ? PostFormModel.fromMap(json["postForm"])
        : null,
  );

  Map<String, dynamic> toMap() => {
    "userid": userid,
    "username": username,
    "fullname": fullname,
    "email": email,
    "postForm": postForm != null ? postForm!.toMap() : null,
  };
}
