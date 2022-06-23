// To parse this JSON data, do
//
//     final attemptListModel = attemptListModelFromJson(jsonString);

import 'dart:convert';

List<AttemptListModel> attemptListModelFromJson(String str) =>
    List<AttemptListModel>.from(
        json.decode(str).map((x) => AttemptListModel.fromJson(x)));

String attemptListModelToJson(List<AttemptListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttemptListModel {
  AttemptListModel({
    required this.uniqueId,
    required this.organizationId,
    this.createdBy,
    this.createdDate,
    this.createdTime,
    required this.itemIdentifier,
    this.nonDeliveryReason,
    this.nonDeliveryMeasure,
    this.nonDeliveryReasonDesc,
    this.nonDeliveryMeasureDesc,
  });

  String uniqueId;
  String organizationId;
  String? createdBy;
  DateTime? createdDate;
  DateTime? createdTime;
  String itemIdentifier;
  int? nonDeliveryReason;
  int? nonDeliveryMeasure;
  dynamic nonDeliveryReasonDesc;
  dynamic nonDeliveryMeasureDesc;

  factory AttemptListModel.fromJson(Map<String, dynamic> json) =>
      AttemptListModel(
        uniqueId: json["uniqueId"],
        organizationId: json["organizationId"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        createdTime: json["createdTime"],
        itemIdentifier: json["itemIdentifier"],
        nonDeliveryReason: json["nonDeliveryReason"],
        nonDeliveryMeasure: json["nonDeliveryMeasure"],
        nonDeliveryReasonDesc: json["nonDeliveryReasonDesc"],
        nonDeliveryMeasureDesc: json["nonDeliveryMeasureDesc"],
      );

  Map<String, dynamic> toJson() => {
        "uniqueId": uniqueId,
        "organizationId": organizationId,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "createdTime": createdTime,
        "itemIdentifier": itemIdentifier,
        "nonDeliveryReason": nonDeliveryReason,
        "nonDeliveryMeasure": nonDeliveryMeasure,
        "nonDeliveryReasonDesc": nonDeliveryReasonDesc,
        "nonDeliveryMeasureDesc": nonDeliveryMeasureDesc,
      };
}
