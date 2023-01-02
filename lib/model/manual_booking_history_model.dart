// To parse this JSON data, do
//
//     final manualBookingHistoryModel = manualBookingHistoryModelFromJson(jsonString);

import 'dart:convert';

ManualBookingHistoryModel manualBookingHistoryModelFromJson(String str) =>
    ManualBookingHistoryModel.fromJson(json.decode(str));

String manualBookingHistoryModelToJson(ManualBookingHistoryModel data) =>
    json.encode(data.toJson());

class ManualBookingHistoryModel {
  ManualBookingHistoryModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory ManualBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      ManualBookingHistoryModel(
        success: json["success"],
        userValue: List<UserValue>.from(
            json["userValue"].map((x) => UserValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userValue": List<dynamic>.from(userValue.map((x) => x.toJson())),
      };
}

class UserValue {
  UserValue({
    this.id,
    this.name,
    this.phonenumber,
    this.pickupLocation,
    this.pickupDate,
    this.dropLocation,
    this.dropDate,
    this.package,
    this.rentalhour,
    this.cab,
    this.subadminId,
    this.km,
    this.price,
    this.driverName,
    this.startOtp,
    this.endOtp,
    this.cancelledBy,
    this.cancelledReason,
    this.tripStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.subadminName,
  });

  int id;
  String name;
  String phonenumber;
  String pickupLocation;
  DateTime pickupDate;
  dynamic dropLocation;
  DateTime dropDate;
  String package;
  dynamic rentalhour;
  String cab;
  int subadminId;
  int km;
  String price;
  String driverName;
  String startOtp;
  String endOtp;
  String cancelledBy;
  String cancelledReason;
  String tripStatus;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String subadminName;

  factory UserValue.fromJson(Map<String, dynamic> json) => UserValue(
        id: json["id"],
        name: json["name"],
        phonenumber: json["phonenumber"],
        pickupLocation: json["pickup_location"],
        pickupDate: DateTime.parse(json["pickup_date"]),
        dropLocation: json["drop_location"],
        dropDate: DateTime.parse(json["drop_date"]),
        package: json["package"],
        rentalhour: json["rentalhour"],
        cab: json["cab"],
        subadminId: json["subadmin_id"],
        km: json["km"] == null ? null : json["km"],
        price: json["price"] == null ? null : json["price"],
        driverName: json["driver_name"] == null ? null : json["driver_name"],
        startOtp: json["start_otp"] == null ? null : json["start_otp"],
        endOtp: json["end_otp"] == null ? null : json["end_otp"],
        cancelledBy: json["cancelled_by"] == null ? null : json["cancelled_by"],
        cancelledReason:
            json["cancelled_reason"] == null ? null : json["cancelled_reason"],
        tripStatus: json["trip_status"] == null ? null : json["trip_status"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subadminName: json["subadminName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phonenumber": phonenumber,
        "pickup_location": pickupLocation,
        "pickup_date": pickupDate.toIso8601String(),
        "drop_location": dropLocation,
        "drop_date": dropDate.toIso8601String(),
        "package": package,
        "rentalhour": rentalhour,
        "cab": cab,
        "subadmin_id": subadminId,
        "km": km == null ? null : km,
        "price": price == null ? null : price,
        "driver_name": driverName == null ? null : driverName,
        "start_otp": startOtp == null ? null : startOtp,
        "end_otp": endOtp == null ? null : endOtp,
        "cancelled_by": cancelledBy == null ? null : cancelledBy,
        "cancelled_reason": cancelledReason == null ? null : cancelledReason,
        "trip_status": tripStatus == null ? null : tripStatus,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subadminName": subadminName,
      };
}
