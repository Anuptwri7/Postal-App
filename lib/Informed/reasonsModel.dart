
import 'dart:convert';

Reason reasonFromJson(String str) => Reason.fromJson(json.decode(str));

String reasonToJson(Reason data) => json.encode(data.toJson());

class Reason {
  Reason({
    this.nonDeliveryModelReason,
    this.nonDeliveryModelMeasure,
  });

  List<NonDeliveryModel>? nonDeliveryModelReason;
  List<NonDeliveryModel> ?nonDeliveryModelMeasure;

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
    nonDeliveryModelReason: List<NonDeliveryModel>.from(json["nonDeliveryModelReason"].map((x) => NonDeliveryModel.fromJson(x))),
    nonDeliveryModelMeasure: List<NonDeliveryModel>.from(json["nonDeliveryModelMeasure"].map((x) => NonDeliveryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "nonDeliveryModelReason": List<dynamic>.from(nonDeliveryModelReason!.map((x) => x.toJson())),
    "nonDeliveryModelMeasure": List<dynamic>.from(nonDeliveryModelMeasure!.map((x) => x.toJson())),
  };
}

class NonDeliveryModel {
  NonDeliveryModel({
    this.choiceId,
    this.nonDeliveryMeasureReason,
  });

  int? choiceId;
  String? nonDeliveryMeasureReason;

  factory NonDeliveryModel.fromJson(Map<String, dynamic> json) => NonDeliveryModel(
    choiceId: json["choiceId"],
    nonDeliveryMeasureReason: json["nonDeliveryMeasureReason"],
  );

  Map<String, dynamic> toJson() => {
    "choiceId": choiceId,
    "nonDeliveryMeasureReason": nonDeliveryMeasureReason,
  };
}
