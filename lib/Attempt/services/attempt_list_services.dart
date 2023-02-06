import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:postal_app/constant/api_constant.dart';

import '../model/attempt_list_model.dart';

Future fetchAttemptList() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse(baseUrl+"/api/home/attemptlist"),
    headers: headers,
  );
  log(response.statusCode.toString());
  log(response.body);
  try {
    if (response.statusCode == 200) {
      return attemptListModelFromJson(response.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}
