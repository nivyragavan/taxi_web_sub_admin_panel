// To parse this JSON data, do
//
//     final rejectedDriversListModel = rejectedDriversListModelFromJson(jsonString);

import 'dart:convert';

RejectedDriversListModel rejectedDriversListModelFromJson(String str) =>
    RejectedDriversListModel.fromJson(json.decode(str));

String rejectedDriversListModelToJson(RejectedDriversListModel data) =>
    json.encode(data.toJson());

class RejectedDriversListModel {
  RejectedDriversListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int statusCode;
  int code;
  String message;
  Body body;

  factory RejectedDriversListModel.fromJson(Map<String, dynamic> json) =>
      RejectedDriversListModel(
        statusCode: json["statusCode"],
        code: json["code"],
        message: json["message"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "code": code,
        "message": message,
        "body": body.toJson(),
      };
}

class Body {
  Body({
    this.approvedDrivers,
  });

  List<ApprovedDriver> approvedDrivers;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        approvedDrivers: List<ApprovedDriver>.from(
            json["approvedDrivers"].map((x) => ApprovedDriver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "approvedDrivers":
            List<dynamic>.from(approvedDrivers.map((x) => x.toJson())),
      };
}

class ApprovedDriver {
  ApprovedDriver({
    this.name,
    this.driverId,
    this.contact,
    this.ownerName,
    this.ownerNumber,
    this.location,
    this.licenseNumber,
    this.expiryDate,
    this.referral,
    this.createdAt,
    this.updatedAt,
    this.createdAtLocal,
    this.updatedAtLocal,
  });

  String name;
  String driverId;
  String contact;
  String ownerName;
  String ownerNumber;
  String location;
  String licenseNumber;
  String expiryDate;
  String referral;
  DateTime createdAt;
  DateTime updatedAt;
  String createdAtLocal;
  String updatedAtLocal;

  factory ApprovedDriver.fromJson(Map<String, dynamic> json) => ApprovedDriver(
        name: json["name"],
        driverId: json["driver_id"],
        contact: json["contact"],
        ownerName: json["owner_name"],
        ownerNumber: json["owner_number"],
        location: json["location"],
        licenseNumber: json["license_number"],
        expiryDate: json["expiry_date"],
        referral: json["referral"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAtLocal: json["createdAt_local"],
        updatedAtLocal: json["updatedAt_local"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "driver_id": driverId,
        "contact": contact,
        "owner_name": ownerName,
        "owner_number": ownerNumber,
        "location": location,
        "license_number": licenseNumber,
        "expiry_date": expiryDate,
        "referral": referral,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "createdAt_local": createdAtLocal,
        "updatedAt_local": updatedAtLocal,
      };
}
