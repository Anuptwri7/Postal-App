// To parse this JSON data, do
//
//     final dispatchMasterList = dispatchMasterListFromJson(jsonString);

import 'dart:convert';

List<DispatchMasterList> dispatchMasterListFromJson(String str) =>
    List<DispatchMasterList>.from(
        json.decode(str).map((x) => DispatchMasterList.fromJson(x)));

String dispatchMasterListToJson(List<DispatchMasterList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DispatchMasterList {
  DispatchMasterList({
    required this.createdDate,
    required this.agentName,
    required this.itemCount,
    required this.agentHandOverId,
    required this.organizationId,
  });

  DateTime createdDate;
  String agentName;
  int itemCount;
  String agentHandOverId;
  String organizationId;

  factory DispatchMasterList.fromJson(Map<String, dynamic> json) =>
      DispatchMasterList(
        createdDate: DateTime.parse(json["createdDate"]),
        agentName: json["agentName"],
        itemCount: json["itemCount"],
        agentHandOverId: json["agentHandOverId"],
        organizationId: json["organizationId"],
      );

  Map<String, dynamic> toJson() => {
        "createdDate": createdDate.toIso8601String(),
        "agentName": agentName,
        "itemCount": itemCount,
        "agentHandOverId": agentHandOverId,
        "organizationId": organizationId,
      };
}
