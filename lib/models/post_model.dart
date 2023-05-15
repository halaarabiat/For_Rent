
import 'dart:convert';

PostFormModel postFormModelFromJson(String str) => PostFormModel.fromMap(json.decode(str));

String postFormModelToJson(PostFormModel data) => json.encode(data.toMap());

class PostFormModel {
  String? userId;
  String? propertyType;
  int? flat;
  int? rooms;
  int? bathrooms;
  String? furnishingStatus;
  bool? garden;
  bool? parking;
  bool? balcony;
  bool? elevator;
  bool? facilities;
  String? country;
  String? governorate;
  String? neighborhood;
  String? description;
  String? phoneNumber;
  int? price;
  List<String>? images;

  PostFormModel({
    this.userId,
    this.propertyType,
    this.flat,
    this.rooms,
    this.bathrooms,
    this.furnishingStatus,
    this.garden,
    this.parking,
    this.balcony,
    this.elevator,
    this.facilities,
    this.country,
    this.governorate,
    this.neighborhood,
    this.description,
    this.phoneNumber,
    this.price,
    this.images,

  });

  factory PostFormModel.fromMap(Map<String, dynamic> json) => PostFormModel(
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
    price: json["price"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );

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
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),

  };
}
