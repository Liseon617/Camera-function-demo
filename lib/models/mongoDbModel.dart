// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

mongoDbModel mongoDbModelFromJson(String str) => mongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(mongoDbModel data) => json.encode(data.toJson());

class mongoDbModel {
  String id;
  String firstName;
  String lastName;

  mongoDbModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory mongoDbModel.fromJson(Map<String, dynamic> json) => mongoDbModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
  };
}
