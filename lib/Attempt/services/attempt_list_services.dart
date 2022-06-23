import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/attempt_list_model.dart';

Future fetchAttemptList() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse("http://202.51.74.57/api/home/attemptlist"),
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
