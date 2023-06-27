// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

mongoDbModel mongoDbModelFromJson(String str) => mongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(mongoDbModel data) => json.encode(data.toJson());

class mongoDbModel {
  String id;
  String userName;
  String accountType;

  mongoDbModel({
    required this.id,
    required this.userName,
    required this.accountType,
  });

  factory mongoDbModel.fromJson(Map<String, dynamic> json) => mongoDbModel(
    id: json["id"],
    userName: json["userName"],
    accountType: json["accountType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "accountType": accountType,
  };
}
