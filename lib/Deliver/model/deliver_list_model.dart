// To parse this JSON data, do
//
//     final deliveredListModel = deliveredListModelFromJson(jsonString);

import 'dart:convert';

List<DeliveredListModel> deliveredListModelFromJson(String str) =>
    List<DeliveredListModel>.from(
        json.decode(str).map((x) => DeliveredListModel.fromJson(x)));

String deliveredListModelToJson(List<DeliveredListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveredListModel {
  DeliveredListModel({
    this.itemIdentifier,
    this.name,
    this.deliveryDate,
    this.location,
    this.deliveryTime,
    this.signatureUrl,
    this.photoUrl,
    this.organizationId,
    this.uniqueId,
    this.createdDate,
    this.createdBy,
  });

  String? itemIdentifier;
  String? name;
  DateTime? deliveryDate;
  String? location;
  DeliveryTime? deliveryTime;
  String? signatureUrl;
  String? photoUrl;
  String? organizationId;
  String? uniqueId;
  DateTime? createdDate;
  String? createdBy;

  factory DeliveredListModel.fromJson(Map<String, dynamic> json) =>
      DeliveredListModel(
        itemIdentifier: json["itemIdentifier"],
        name: json["name"],
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        location: json["location"],
        deliveryTime: DeliveryTime.fromJson(json["deliveryTime"]),
        signatureUrl: json["signatureUrl"],
        photoUrl: json["photoUrl"],
        organizationId: json["organizationId"],
        uniqueId: json["uniqueId"],
        createdDate: DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "itemIdentifier": itemIdentifier,
        "name": name,
        "deliveryDate": deliveryDate,
        "location": location,
        "deliveryTime": deliveryTime!.toJson(),
        "signatureUrl": signatureUrl,
        "photoUrl": photoUrl,
        "organizationId": organizationId,
        "uniqueId": uniqueId,
        "createdDate": createdDate,
        "createdBy": createdBy,
      };
}

class DeliveryTime {
  DeliveryTime({
    this.hasValue,
    required this.value,
  });

  bool? hasValue;
  Map<String, double> value;

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
        hasValue: json["hasValue"],
        value: Map.from(json["value"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "hasValue": hasValue,
        "value": Map.from(value).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
