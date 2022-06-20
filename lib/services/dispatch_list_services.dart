import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/dispatch_list_model.dart';

Future fetchDispatchList(String agentId) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final msg = jsonEncode({
    "agentHandOverId": agentId,
  });
  final response = await http.post(
    Uri.parse("http://202.51.74.57/api/home/agenthandoveritem"),
    headers: headers,
    body: msg,
  );

  try {
    if (response.statusCode == 200) {
      return dispatchListModelFromJson(response.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}
