import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:postal_app/Informed/reasonsModel.dart';
import 'package:postal_app/constant/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<NonDeliveryModel> allReason = <NonDeliveryModel>[];
Future fetchReasonsFromUrl() async {
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  final response = await http.get(
      Uri.parse(baseUrl + '/api/home/reason'),
      );

  // log(response.body);

  try {
    if (response.statusCode == 200) {
      int resultLength = json.decode(response.body).length;
      for (var i = 0; i < resultLength; i++) {
        allReason.add(NonDeliveryModel(
          choiceId: json.decode(response.body)['nonDeliveryModelReason'][i]['choiceId'],
          nonDeliveryMeasureReason: json.decode(response.body)['nonDeliveryModelReason'][i]['nonDeliveryMeasureReason']

        ));
      }
      // log(allSupplier.length.toString());
      return allReason;
    }
  } catch (e) {
    throw Exception(e);
  }
}
