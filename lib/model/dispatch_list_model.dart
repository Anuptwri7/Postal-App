// To parse this JSON data, do
//
//     final dispatchListModel = dispatchListModelFromJson(jsonString);

import 'dart:convert';

List<DispatchListModel> dispatchListModelFromJson(String str) =>
    List<DispatchListModel>.from(
        json.decode(str).map((x) => DispatchListModel.fromJson(x)));

String dispatchListModelToJson(List<DispatchListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DispatchListModel {
  DispatchListModel({
    this.uniqueId,
    required this.itemIdentifier,
    required this.isDelivered,
    required this.isAttempted,
    // this.createdDate,
  });

  int? uniqueId;
  String itemIdentifier;
  bool isDelivered;
  bool isAttempted;
  // DateTime? createdDate;

  factory DispatchListModel.fromJson(Map<String, dynamic> json) =>
      DispatchListModel(
        uniqueId: json["uniqueId"],
        itemIdentifier: json["itemIdentifier"],
        isDelivered: json["isDelivered"],
        isAttempted: json["isAttempted"],
        // createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "uniqueId": uniqueId,
        "itemIdentifier": itemIdentifier,
        "isDelivered": isDelivered,
        "isAttempted": isAttempted,
        // "createdDate": createdDate,
      };
}
