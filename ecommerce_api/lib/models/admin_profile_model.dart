// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

AdminProfileModel orderModelFromJson(String str) => AdminProfileModel.fromJson(json.decode(str));

String orderModelToJson(AdminProfileModel data) => json.encode(data.toJson());

class AdminProfileModel {
  AdminProfileModel({
    this.id,
    this.name,
    this.email,
    this.contact,
    this.image,
    this.billingAddress,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? contact;
  final String? image;
  final BillingAddress? billingAddress;

  factory AdminProfileModel.fromJson(Map<String, dynamic> json) => AdminProfileModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    contact: json["contact"] == null ? null : json["contact"],
    image: json["image"] == null ? null : json["image"],
    billingAddress: json["billing_address"] == null ? null : BillingAddress.fromJson(json["billing_address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "contact": contact == null ? null : contact,
    "image": image == null ? null : image,
    "billing_address": billingAddress == null ? null : billingAddress!.toJson(),
  };
}

class BillingAddress {
  BillingAddress({
    this.contact,
    this.area,
    this.appartment,
    this.house,
    this.road,
    this.city,
    this.district,
    this.zipCode,
  });

  final String? contact;
  final String? area;
  final String? appartment;
  final String? house;
  final String? road;
  final String? city;
  final String? district;
  final String? zipCode;

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
    contact: json["contact"] == null ? null : json["contact"],
    area: json["area"] == null ? null : json["area"],
    appartment: json["appartment"] == null ? null : json["appartment"],
    house: json["house"] == null ? null : json["house"],
    road: json["road"] == null ? null : json["road"],
    city: json["city"] == null ? null : json["city"],
    district: json["district"] == null ? null : json["district"],
    zipCode: json["zip_code"] == null ? null : json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "contact": contact == null ? null : contact,
    "area": area == null ? null : area,
    "appartment": appartment == null ? null : appartment,
    "house": house == null ? null : house,
    "road": road == null ? null : road,
    "city": city == null ? null : city,
    "district": district == null ? null : district,
    "zip_code": zipCode == null ? null : zipCode,
  };
}
