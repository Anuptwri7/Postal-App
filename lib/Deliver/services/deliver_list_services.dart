import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:postal_app/constant/api_constant.dart';

import '../model/deliver_list_model.dart';

Future fetchDeliverList() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse(baseUrl+"/api/home/deliverlist"),
    headers: headers,
  );
  log(response.body.toString());
  log(response.statusCode.toString());
  // log(response.body);

  try {
    if (response.statusCode == 200) {
      return deliveredListModelFromJson(response.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}
