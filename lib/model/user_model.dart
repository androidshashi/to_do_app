import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? email;
  DateTime? createdAt;

  UserModel({
    this.email,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    createdAt: json["createdAt"]!=null? DateTime.parse(json["createdAt"]):null
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "createdAt": createdAt?.toIso8601String(),
  };
}