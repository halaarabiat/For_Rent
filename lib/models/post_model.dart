import 'dart:convert';

import 'package:rent/config/current_session.dart';

PostFormModel postFormModelFromJson(String str) =>
    PostFormModel.fromMap(json.decode(str));

String postFormModelToJson(PostFormModel data) => json.encode(data.toMap());

class PostFormModel {
  String? userId;
  String? propertyType;
  int? flat;
  int? rooms;
  int? bathrooms;
  String? furnishingStatus;
  bool garden;
  bool parking;
  bool balcony;
  bool elevator;
  bool facilities;
  String? country;
  String? governorate;
  String? neighborhood;
  String? description;
  String? phoneNumber;
  int price;
  List<String>? images;
  List<String>? usersFavs;
  bool isFav;
  String? documentId;

  PostFormModel({
    this.userId,
    this.propertyType,
    this.flat,
    this.rooms,
    this.bathrooms,
    this.furnishingStatus,
    this.garden = false,
    this.parking = false,
    this.balcony = false,
    this.elevator = false,
    this.facilities = false,
    this.country,
    this.governorate,
    this.neighborhood,
    this.description,
    this.phoneNumber,
    this.price = 0,
    this.images,
    this.documentId,
    this.usersFavs,
    this.isFav = false,
  });

  factory PostFormModel.fromMap(Map<String, dynamic> json) {
    var model = PostFormModel(
      userId: json["userId"],
      propertyType: json["propertyType"],
      flat: json["flat"],
      rooms: json["rooms"],
      bathrooms: json["bathrooms"],
      furnishingStatus: json["furnishingStatus"],
      garden: json["Garden"],
      parking: json["Parking"],
      balcony: json["Balcony"],
      elevator: json["Elevator"],
      facilities: json["Facilities"],
      country: json["country"],
      governorate: json["governorate"],
      neighborhood: json["neighborhood"],
      description: json["description"],
      phoneNumber: json["phoneNumber"],
      price: json["price"] ?? 0,
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      usersFavs: json["usersFavs"] == null
          ? []
          : List<String>.from(json["usersFavs"]!.map((x) => x)),
    );
    if (model != null && CurrentSession().user != null) {
      if (CurrentSession().user!.userid != null) {
        if (model.usersFavs!.contains(CurrentSession().user!.userid!)) {
          model.isFav = true;
        }
      }
    }
    return model;
  }

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "propertyType": propertyType,
        "flat": flat,
        "rooms": rooms,
        "bathrooms": bathrooms,
        "furnishingStatus": furnishingStatus,
        "Garden": garden,
        "Parking": parking,
        "Balcony": balcony,
        "Elevator": elevator,
        "Facilities": facilities,
        "country": country,
        "governorate": governorate,
        "neighborhood": neighborhood,
        "description": description,
        "phoneNumber": phoneNumber,
        "price": price,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "usersFavs": usersFavs == null
            ? []
            : List<dynamic>.from(usersFavs!.map((x) => x)),
      };
}
