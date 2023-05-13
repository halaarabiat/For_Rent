// To parse this JSON data, do
//
//     final postFormModel = postFormModelFromJson(jsonString);

import 'dart:convert';

PostFormModel postFormModelFromJson(String str) => PostFormModel.fromJson(json.decode(str));

String postFormModelToJson(PostFormModel data) => json.encode(data.toJson());

class PostFormModel {
  String? propertyType;
  String? flat;
  String? rooms;
  String? bathrooms;
  String? furnishingStatus;
  String? country;
  String? governorate;
  String? neighborhood;
  String? description;
  String? phoneNumber;
  String? price;

  PostFormModel({
    this.propertyType,
    this.flat,
    this.rooms,
    this.bathrooms,
    this.furnishingStatus,
    this.country,
    this.governorate,
    this.neighborhood,
    this.description,
    this.phoneNumber,
    this.price,
  });

  factory PostFormModel.fromJson(Map<String, dynamic> json) => PostFormModel(
    propertyType: json["propertyType"],
    flat: json["flat"],
    rooms: json["rooms"],
    bathrooms: json["bathrooms"],
    furnishingStatus: json["furnishingStatus"],
    country: json["country"],
    governorate: json["governorate"],
    neighborhood: json["neighborhood"],
    description: json["description"],
    phoneNumber: json["phoneNumber"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "propertyType": propertyType,
    "flat": flat,
    "rooms": rooms,
    "bathrooms": bathrooms,
    "furnishingStatus": furnishingStatus,
    "country": country,
    "governorate": governorate,
    "neighborhood": neighborhood,
    "description": description,
    "phoneNumber": phoneNumber,
    "price": price,
  };
}
